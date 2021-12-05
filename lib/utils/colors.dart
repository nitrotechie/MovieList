import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color canvasColor = const Color(0xFFFDFDFD);
  static Color gradientColor1 = const Color(0xFF3764B8);
  static Color gradientColor2 = const Color(0xFF47D3E7);
  static Color blackColor = const Color(0xFF000000);
  static List pieColors = [
    const Color(0xff154874),
    const Color(0xff3494E6),
    const Color(0xffBBD4F2),
    const Color(0xff5FD9F9),
  ];
  static List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5),
        spreadRadius: -5,
        offset: const Offset(-5, -5),
        blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900]!.withOpacity(.2),
        spreadRadius: 2,
        offset: const Offset(7, 7),
        blurRadius: 20)
  ];
}
