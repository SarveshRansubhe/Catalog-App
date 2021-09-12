import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.cyan,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  //colors:
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray800;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
