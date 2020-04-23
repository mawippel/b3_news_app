import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseErrorHandler {
  static void handle(String errorType) {
    Get.defaultDialog(
      title: 'Erro!',
      content: Text(_getErrorMessageByType(errorType)),
    );
  }

  static String _getErrorMessageByType(String errorType) {
    switch (errorType) {
      // Login
      case 'ERROR_INVALID_EMAIL':
        return 'O e-Mail informado não possui um formato válido';
      case 'ERROR_WRONG_PASSWORD':
        return 'Senha incorreta, tente novamente';
      case 'ERROR_USER_NOT_FOUND':
        return 'Usuário não encontrado, tente novamente';
      case 'ERROR_USER_DISABLED':
        return 'Usuário foi desabilitado, contate o administrador do sistema';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'O número máximo de tentativas para esse usuário foi alcançado, contate o administrador do sistema';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Operação não permitida, contate o administrador do sistema';
      // Registro
      case 'ERROR_WEAK_PASSWORD':
        return 'Senha fraca, tente novamente com uma senha mais forte';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'e-Mail já utilizado, tente novamente com outro usuário';
      default:
        return 'Erro não esperado, contate o administrador do sistema';
    }
  }
}
