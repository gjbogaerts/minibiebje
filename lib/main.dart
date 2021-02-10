import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/utils/service_locator.dart';
import 'ui/screens/auth_screen.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/library_screen.dart';
import 'ui/screens/search_screen.dart';
import 'ui/theming/custom_theme.dart';
import 'ui/widgets/dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  setupDialog();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.standardTheme,
      home: SearchScreen(),
      navigatorKey: StackedService.navigatorKey,
      routes: {
        AuthScreen.routeName: (ctx) => AuthScreen(),
        LibraryScreen.routeName: (ctx) => LibraryScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
