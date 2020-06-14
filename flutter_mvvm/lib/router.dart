import 'package:flutter/material.dart';

import 'package:flutter_mvvm/ui/home/home.dart';
import 'package:flutter_mvvm/ui/login/login.dart';

const String initialRoute = LoginPage.routeName;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (_) => LoginPage());

    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => HomePage());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
