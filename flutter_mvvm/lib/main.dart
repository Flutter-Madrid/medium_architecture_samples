import 'package:flutter/material.dart';

import 'package:flutter_mvvm/router.dart';
import 'package:flutter_mvvm/locator.dart';
import 'package:flutter_mvvm/core/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      initialRoute: initialRoute,
      onGenerateRoute: generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}
