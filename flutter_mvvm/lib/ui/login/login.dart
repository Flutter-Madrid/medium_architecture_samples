import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mvvm/core/viewmodels/login_page_model.dart';
import 'package:flutter_mvvm/locator.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageModel>(
      create: (_) => locator<LoginPageModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          leading: SizedBox(),
        ),
        body: Consumer<LoginPageModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Iniciar sesión',
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(
                    height: 32,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: model.errorMessageEmail,
                    ),
                    onChanged: model.saveEmail,
                    controller: TextEditingController(
                      text: model.email,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: model.errorMessagePassword,
                    ),
                    onChanged: model.savePassword,
                    controller: TextEditingController(text: model.password),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    onPressed: model.validate,
                    child: Text('Inicia sesión'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
