import 'package:flutter/material.dart';

import 'ui/screens/home_screen.dart';
import 'ui/theming/custom_theme.dart';
import 'ui/screens/auth_screen.dart';
import 'core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.standardTheme,
      home: HomeScreen(),
      routes: {
        AuthScreen.routeName: (ctx) => AuthScreen(),
      },
    );
  }
}
