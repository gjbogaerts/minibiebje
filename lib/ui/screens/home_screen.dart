import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/viewmodels/home_screen_model.dart';
import '../theming/paddings.dart';
import 'auth_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var user = model.user;
    return ViewModelBuilder<HomeScreenModel>.reactive(
      viewModelBuilder: () => HomeScreenModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Je eigen bibliotheek'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Paddings.screenPadding),
          child: Column(
            children: [
              Text(
                'Ingang',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: Paddings.dividerHeight,
              ),
              if (model.user != null) Text('Welkom ${model.user.username}'),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AuthScreen.routeName),
                child: Text('Inloggen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
