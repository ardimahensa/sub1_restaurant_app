import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils extends GetxController {
  static Utils get to => Get.find();

  static Color greyLight = const Color.fromRGBO(247, 247, 247, 1);
  static Color greyDark = const Color.fromRGBO(90, 90, 90, 1);
  static Color white = const Color.fromRGBO(255, 241, 242, 1);
  static Color black = const Color.fromARGB(255, 0, 0, 0);
  static Color redDark = const Color.fromARGB(255, 213, 13, 43);
  static Color redLight = const Color.fromRGBO(250, 1, 0, 1);
  static Color yellow = const Color.fromARGB(255, 255, 242, 0);
  static Color green = const Color.fromARGB(255, 62, 206, 9);

  static TextStyle titleText = GoogleFonts.notoSans();
  static TextStyle subTitleText = GoogleFonts.roboto();
  static TextStyle infoText = GoogleFonts.actor();

  static Color textColor = const Color(0xFFccc7c5);
  static Color mainColor = const Color(0xFF89dad0);
  static Color iconColor1 = const Color(0xFFffd28d);
  static Color iconColor2 = const Color(0xFFfcab88);
  static Color paraColor = const Color(0xFF8f837f);
  static Color buttonBackgroundColor = const Color(0xFFf7f6f4);
  static Color signColor = const Color(0xFFa9a29f);
  static Color titleColor = const Color(0xFF5c524f);
  static Color mainBlackColor = const Color(0xFF332d2b);
  static Color yellowColor = const Color(0xFFffd379);
  static Color allWhite = Colors.white;
}
