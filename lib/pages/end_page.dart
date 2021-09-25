import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thanks for the purchase!!"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Align(
            alignment: Alignment.center,
          ),
          
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text("Confirm"),
                        content: Text("Do you really want to exit this app"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("NO"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                              child: Text("YES"),
                              onPressed: () => SystemNavigator.pop()),
                        ],
                      ));
            },
            child: Text(
              "Exit App?",
              style: TextStyle(color: Colors.black),
            ),
          ),
          
        ],
      ),
    );
  }
}
