import 'package:flutter/material.dart';

import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';



Widget elevatedButtonWidget(String text,void Function()? onPressed){
  return  SizedBox(
      width: 300,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  AppColors().blackColor),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
          onPressed: onPressed,
          child: textWidget(text, AppColors().whiteColor, 15, FontWeight.w500)));
}