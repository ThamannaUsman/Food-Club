import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

Widget orderAmountDetails({name,price}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget("$name", AppColors().blackColor, 16, FontWeight.w600),
        textWidget( '\₹' + "$price", AppColors().redAccentColor, 18, FontWeight.w700),
      ],
    ),
  );
}