import 'package:flutter/material.dart';

Widget textWidget(String text,Color color,double fontSize,FontWeight fontWeight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color:color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}