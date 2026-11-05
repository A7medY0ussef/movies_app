import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/errors/error_mapper.dart';
import 'package:movie_app/modules/auth/data/models/user_model.dart';
import 'package:movie_app/modules/layout/profile/data/models/saved_movie_model.dart';

class ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  ProfileRemoteDataSource({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        firestore = firestore ?? FirebaseFirestore.instance;



  Future<UserModel> getProfile() async {
    final user = firebaseAuth.currentUser;

    if (user == null) {
      throw const AppException('errors.no_user');
    }

    final doc = await firestore.collection('users').doc(user.uid).get();

    if (!doc.exists || doc.data() == null) {
      throw const AppException('errors.profile_not_found');
    }

    return UserModel.fromMap(
      doc.data()!,
      uid: user.uid,
    );
  }

  Future<UserModel> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    final user = firebaseAuth.currentUser;

    if (user == null) {
      throw const AppException('errors.no_user');
    }

    await firestore.collection('users').doc(user.uid).update({
      'name': name,
      'phoneNumber': phoneNumber,
      'avatarPath': avatarPath,
    });

    return getProfile();
  }



  Future<List<SavedMovieModel>> getHistory() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return [];

    final snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .get();

    final list = snapshot.docs
        .map((doc) => SavedMovieModel.fromMap(doc.data()))
        .toList();
    list.sort((a, b) => b.savedAt.compareTo(a.savedAt));
    return list;
  }

  Stream<List<SavedMovieModel>> getHistoryStream() {
    final user = firebaseAuth.currentUser;
    if (user == null) return Stream.value([]);

    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .snapshots()
        .map((snapshot) {
      final list = snapshot.docs
          .map((doc) => SavedMovieModel.fromMap(doc.data()))
          .toList();
      list.sort((a, b) => b.savedAt.compareTo(a.savedAt));
      return list;
    });
  }

  Future<void> addToHistory({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) return;

    final movie = SavedMovieModel(
      id: id,
      title: title,
      rating: rating,
      imageUrl: imageUrl,
      savedAt: DateTime.now(),
    );

    await firestore
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .doc(id.toString())
        .set(movie.toMap(), SetOptions(merge: true));
  }



  Future<List<SavedMovieModel>> getWatchlist() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return [];

    final snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .get();

    final list = snapshot.docs
        .map((doc) => SavedMovieModel.fromMap(doc.data()))
        .toList();
    list.sort((a, b) => b.savedAt.compareTo(a.savedAt));
    return list;
  }

  Stream<List<SavedMovieModel>> getWatchlistStream() {
    final user = firebaseAuth.currentUser;
    if (user == null) return Stream.value([]);

    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .snapshots()
        .map((snapshot) {
      final list = snapshot.docs
          .map((doc) => SavedMovieModel.fromMap(doc.data()))
          .toList();
      list.sort((a, b) => b.savedAt.compareTo(a.savedAt));
      return list;
    });
  }

  Future<bool> isInWatchlist(int movieId) async {
    final user = firebaseAuth.currentUser;
    if (user == null) return false;

    final doc = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movieId.toString())
        .get();

    return doc.exists;
  }

  Future<bool> toggleWatchlist({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw const AppException('errors.no_user');

    final docRef = firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(id.toString());

    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
      return false;
    } else {
      final movie = SavedMovieModel(
        id: id,
        title: title,
        rating: rating,
        imageUrl: imageUrl,
        savedAt: DateTime.now(),
      );
      await docRef.set(movie.toMap(), SetOptions(merge: true));
      return true;
    }
  }
}
