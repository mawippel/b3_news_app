import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future loginWithEmail({
    @required String email,
    @required password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  static Future signUpWithEmail({
    @required String email,
    @required password,
  }) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  static Future getUserLogged() async {
    return await _firebaseAuth.currentUser();
  }

  static void logout() {
    _firebaseAuth.signOut();
  }
}
