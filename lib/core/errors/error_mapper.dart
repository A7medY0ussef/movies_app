import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppException implements Exception {
  final String key;
  const AppException(this.key);
}

String mapErrorToKey(Object e) {
  if (e is AppException) return e.key;
  if (e is FirebaseAuthException) {
    switch (e.code) {
      case 'invalid-email':
        return 'errors.invalid_email';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'errors.invalid_credentials';
      case 'email-already-in-use':
        return 'errors.email_in_use';
      case 'weak-password':
        return 'errors.weak_password';
      case 'user-disabled':
        return 'errors.user_disabled';
      case 'too-many-requests':
        return 'errors.too_many_requests';
      case 'requires-recent-login':
        return 'errors.requires_recent_login';
      case 'network-request-failed':
        return 'errors.network';
      default:
        return 'errors.unknown';
    }
  }

  if (e is GoogleSignInException) {
    return e.code == GoogleSignInExceptionCode.canceled
        ? 'errors.google_cancelled'
        : 'errors.unknown';
  }

  if (e is FirebaseException) {
    if (e.code == 'unavailable') return 'errors.network';
    return 'errors.server';
  }

  if (e is SocketException) return 'errors.network';

  return 'errors.unknown';
}
