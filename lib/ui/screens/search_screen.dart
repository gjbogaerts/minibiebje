import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/viewmodels/search_screen_model.dart';
import '../theming/paddings.dart';
import '../widgets/drawer.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchScreenModel>.reactive(
      viewModelBuilder: () => SearchScreenModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Zoek een boek'),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Paddings.screenPadding),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Titel'),
                        onChanged: (val) => model.title = val,
                      ),
                      SizedBox(
                        height: Paddings.dividerHeight,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Auteur'),
                        onChanged: (val) => model.author = val,
                      ),
                      SizedBox(
                        height: Paddings.dividerHeight,
                      ),
                      ElevatedButton(
                        child: Text('Zoeken'),
                        onPressed: () => {model.startSearch()},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
