import 'package:flutter/material.dart';

Widget outLineButtonWidget(double width,double height,Color color,String text,Color textColor,void Function()? onPressed){
  return  SizedBox(
    width:width,
    height: height,
    child: OutlinedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: color)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder())
        ),
        onPressed: onPressed, child: Text(text,style: TextStyle(color: textColor,fontSize: 20),)),
  );
}