import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
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
    if(!_isEmailValid(email)){
      return 'Email com formato inválido';
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

  bool _isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
