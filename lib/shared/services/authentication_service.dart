import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class AuthenticationService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final mainStore = GetIt.I.get<MainStore>();

  static Future loginWithEmail({
    @required String email,
    @required password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      mainStore.authStore.isAuthenticated = true;
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  static Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
      print(email);
      print(password);
      var xd = await _firebaseAuth.fetchSignInMethodsForEmail(email: 'mawippel2@hotmail.com');
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('registrou');
      // mainStore.authStore.isAuthenticated = true;
      return authResult.user != null;
  }

  static Future getLoggedUser() async {
    return _firebaseAuth.currentUser();
  }

  static Future logout() async {
    await _firebaseAuth.signOut();
    mainStore.authStore.isAuthenticated = false;
  }
}
