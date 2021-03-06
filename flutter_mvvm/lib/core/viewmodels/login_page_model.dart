import 'package:flutter/material.dart';

import 'package:flutter_mvvm/locator.dart';
import 'package:flutter_mvvm/core/models/login_form.dart';
import 'package:flutter_mvvm/core/services/navigation_service.dart';
import 'package:flutter_mvvm/core/shared/utils.dart';
import 'package:flutter_mvvm/ui/home/home.dart';

class LoginPageModel extends ChangeNotifier {
  LoginForm _loginForm = new LoginForm();

  String get email => _loginForm.email;
  String get password => _loginForm.password;

  String errorMessageEmail;
  String errorMessagePassword;

  isValidEmail() {
    errorMessageEmail = null;

    if (email == null || !validateEmail(email))
      errorMessageEmail = 'Por favor introduzca un email correcto';
  }

  isValidPassword() {
    errorMessagePassword = null;

    if (password == null) {
      errorMessagePassword = 'Por favor introduzca la contraseña';
    } else {
      if (password.length != 6)
        errorMessagePassword =
            'La contraseña debe tener una longitud de 6 caracteres';
    }
  }

  void validate() {
    if (isValidForm())
      locator<NavigationService>().navigateTo(HomePage.routeName);

    notifyListeners();
  }

  bool isValidForm() {
    isValidEmail();
    isValidPassword();

    return errorMessageEmail == null && errorMessagePassword == null;
  }

  savePassword(String value) {
    _loginForm.password = value;
  }

  saveEmail(String value) {
    _loginForm.email = value;
  }
}
