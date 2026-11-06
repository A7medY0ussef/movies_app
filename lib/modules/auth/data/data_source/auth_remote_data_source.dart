
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSource({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    final credential =
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await firestore.collection('users').doc(credential.user!.uid).set({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarPath': avatarPath,
    });

    return credential;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userDoc = await firestore
        .collection('users')
        .doc(credential.user!.uid)
        .get();

    return {
      'uid': credential.user!.uid,
      ...userDoc.data()!,
    };
  }

  Future<Map<String, dynamic>> loginWithGoogle() async {
    final googleUser = await GoogleSignIn.instance.authenticate();

    final googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential =
    await firebaseAuth.signInWithCredential(credential);

    final user = userCredential.user!;

    final userDoc = firestore.collection('users').doc(user.uid);
    final docSnapshot = await userDoc.get();

    if (!docSnapshot.exists) {
      await userDoc.set({
        'name': user.displayName ?? '',
        'email': user.email ?? '',
        'phoneNumber': user.phoneNumber ?? '',
        'avatarPath': user.photoURL ?? '',
      });
    }

    final updatedDoc = await userDoc.get();

    return {
      'uid': user.uid,
      ...updatedDoc.data()!,
    };
  }

  Future<void> forgetPassword({
    required String email,
  }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
