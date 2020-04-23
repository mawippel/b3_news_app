import 'package:b3_news_app/shared/handlers/firebase_error_handler.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
      mainStore.loginStore.isLoading = true;
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      mainStore.loginStore.isLoading = false;
      mainStore.authStore.isAuthenticated = true;
      return user != null;
    } catch (e) {
      mainStore.loginStore.isLoading = false;
      FirebaseErrorHandler.handle(e.code);
    }
  }

  static Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      mainStore.registerStore.isLoading = true;
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      mainStore.registerStore.isLoading = false;
      mainStore.authStore.isAuthenticated = true;
      return authResult.user != null;
    } catch (e) {
      mainStore.registerStore.isLoading = false;
      FirebaseErrorHandler.handle(e.code);
    }
  }

  static Future getLoggedUser() async {
    return _firebaseAuth.currentUser();
  }

  static Future logout() async {
    await _firebaseAuth.signOut();
    mainStore.authStore.isAuthenticated = false;
  }
}
