import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  String username;

  @observable
  String password;

  @observable
  bool obscurePassword = true;

  @computed
  bool get isValid => validateUsername() == null && validatePassword() == null;

  @action
  void setUsername(String newValue) {
    username = newValue;
  }

  @action
  void setPassword(String newValue) {
    password = newValue;
  }

  @action
  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
  }

  String validateUsername() {
    if (username == null || username.isEmpty) {
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