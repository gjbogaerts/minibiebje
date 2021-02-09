import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/viewmodels/home_screen_model.dart';
import '../screens/auth_screen.dart';
import '../screens/library_screen.dart';
import '../screens/search_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenModel>.reactive(
      viewModelBuilder: () => HomeScreenModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(model.user != null
                  ? 'Welkom ${model.user.username}'
                  : 'Welkom'),
            ),
            ListTile(
              title: Text('Zoekscherm'),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(SearchScreen.routeName),
            ),
            ListTile(
              title: Text(model.hasAuth
                  ? 'Naar je bibliotheek'
                  : 'Om een bibliotheek te bouwen, moet je ingelogd zijn'),
              onTap: () => model.hasAuth
                  ? Navigator.of(context)
                      .pushReplacementNamed(LibraryScreen.routeName)
                  : null,
            ),
            ListTile(
              title: Text(model.hasAuth ? 'Log uit' : 'Inloggen'),
              onTap: () {
                if (model.hasAuth) {
                  model.logout();
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushNamed(AuthScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
