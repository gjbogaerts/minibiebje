import 'package:flutter/material.dart';
import 'package:minibieb/ui/widgets/drawer.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoek een boek'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Zoekscherm'),
      ),
    );
  }
}
