import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The End"),
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
          Image.asset(
            "assets/images/150.jpg",
            fit: BoxFit.cover,
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
                        title: Text("150 rupiya dega?"),
                        content: Text("Ha ya Na"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("Mai garib hu..."),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                              child: Text("Haa bahut paisa hai"),
                              onPressed: () => SystemNavigator.pop()),
                        ],
                      ));
            },
            child: Text(
              "Bolo Bhai",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
