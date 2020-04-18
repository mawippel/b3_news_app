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
          Get.offNamed(HomePage.name);
        } else {
          Get.offNamed(LoginPage.name);
        }
      },
    );
  }

  @observable
  bool isAuthenticated;
}
