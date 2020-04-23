import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  String email;

  @observable
  String password;

  @observable
  bool isLoading = false;

  @observable
  bool obscurePassword = true;

  @computed
  bool get isValid => validateEmail() == null && validatePassword() == null;

  @action
  void setEmail(String newValue) {
    email = newValue;
  }

  @action
  void setPassword(String newValue) {
    password = newValue;
  }

  @action
  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return 'Obrigatório';
    }
    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return 'Obrigatório';
    }
    if (password.length < 8) {
      return 'Sua senha deve possuir mais que 8 caracteres';
    }
    return null;
  }
}
