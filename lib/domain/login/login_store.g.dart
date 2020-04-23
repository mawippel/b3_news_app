// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$emailAtom = Atom(name: '_LoginStoreBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_LoginStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$obscurePasswordAtom = Atom(name: '_LoginStoreBase.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.context.enforceReadPolicy(_$obscurePasswordAtom);
    _$obscurePasswordAtom.reportObserved();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.context.conditionallyRunInAction(() {
      super.obscurePassword = value;
      _$obscurePasswordAtom.reportChanged();
    }, _$obscurePasswordAtom, name: '${_$obscurePasswordAtom.name}_set');
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setEmail(String newValue) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setEmail(newValue);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String newValue) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setPassword(newValue);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeObscurePassword() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.changeObscurePassword();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},password: ${password.toString()},isLoading: ${isLoading.toString()},obscurePassword: ${obscurePassword.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
