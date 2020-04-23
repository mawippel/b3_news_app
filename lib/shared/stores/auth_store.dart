import 'package:b3_news_app/domain/home/home_page.dart';
import 'package:b3_news_app/domain/login/login_page.dart';
import 'package:b3_news_app/shared/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase() {
    reaction<bool>(
      (_) => isAuthenticated,
      (isAuthenticated) async {
        if (isAuthenticated) {
          await AuthService.saveNewToken();
          await Get.offNamedUntil(HomePage.name, (_) => false);
        } else {
          await AuthService.removeToken();
          await Get.offNamedUntil(LoginPage.name, (_) => false);
        }
      },
    );
  }

  @observable
  bool isAuthenticated;
}
