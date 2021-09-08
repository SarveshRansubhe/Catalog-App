import 'package:flutter/material.dart';
import 'package:flutter_catelog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
