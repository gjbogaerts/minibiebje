import 'package:flutter/material.dart';
import 'package:minibieb/ui/widgets/drawer.dart';

class LibraryScreen extends StatelessWidget {
  static const routeName = '/library';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Je bibliotheek'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Library Screen'),
      ),
    );
  }
}
