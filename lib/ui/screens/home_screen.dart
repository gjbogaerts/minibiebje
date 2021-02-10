import 'package:flutter/material.dart';
import 'package:minibieb/ui/widgets/drawer.dart';
import 'package:stacked/stacked.dart';

import '../../core/viewmodels/home_screen_model.dart';
import '../theming/paddings.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
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
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(Paddings.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Ingang',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: Paddings.dividerHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
