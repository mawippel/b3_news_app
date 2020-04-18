// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$usernameAtom = Atom(name: '_RegisterStoreBase.username');

  @override
  String get username {
    _$usernameAtom.context.enforceReadPolicy(_$usernameAtom);
    _$usernameAtom.reportObserved();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.context.conditionallyRunInAction(() {
      super.username = value;
      _$usernameAtom.reportChanged();
    }, _$usernameAtom, name: '${_$usernameAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_RegisterStoreBase.password');

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

  final _$obscurePasswordAtom =
      Atom(name: '_RegisterStoreBase.obscurePassword');

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

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  void setUsername(String newValue) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction();
    try {
      return super.setUsername(newValue);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String newValue) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction();
    try {
      return super.setPassword(newValue);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeObscurePassword() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction();
    try {
      return super.changeObscurePassword();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'username: ${username.toString()},password: ${password.toString()},obscurePassword: ${obscurePassword.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
