import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user.dart';

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User _firebaseUser(FirebaseUser firebaseUser) {
    if (firebaseUser == null) {
      return null;
    }
    return User(emailID: firebaseUser.email, photoURL: firebaseUser.photoUrl);
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_firebaseUser);
  }

  @override
  Future<User> currentUser() async {
    final firebaseUser = await _firebaseAuth.currentUser();
    return _firebaseUser(firebaseUser);
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleSignInAuth = await googleAccount.authentication;
      if (googleSignInAuth.accessToken != null &&
          googleSignInAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: googleSignInAuth.idToken,
                accessToken: googleSignInAuth.accessToken));
        return _firebaseUser(authResult.user);
      } else
        throw PlatformException(
            code: 'GOOGLE_SIGN_IN_AUTHENTICATION_TOKEN_IS_MISSING',
            message: 'Google Sign In Authentication Token is Missing');
    } else {
      throw PlatformException(
          code: 'SIGN_IN_PROCESS_ABORTED', message: 'Sign in Process Aborted');
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
