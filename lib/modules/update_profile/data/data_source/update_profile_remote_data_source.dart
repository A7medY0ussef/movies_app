import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/modules/auth/data/models/user_model.dart';

class UpdateProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UpdateProfileRemoteDataSource({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserModel> getUserData() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('No user is logged in');
    }

    final doc = await firestore.collection('users').doc(user.uid).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('User profile not found');
    }

    return UserModel.fromMap(doc.data()!, uid: user.uid);
  }

  Future<UserModel> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('No user is logged in');
    }

    await firestore.collection('users').doc(user.uid).update({
      'name': name,
      'phoneNumber': phoneNumber,
      'avatarPath': avatarPath,
    });

    return getUserData();
  }

  Future<void> deleteAccount() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('No user is logged in');
    }

    await firestore.collection('users').doc(user.uid).delete();


    await user.delete();
  }
}
