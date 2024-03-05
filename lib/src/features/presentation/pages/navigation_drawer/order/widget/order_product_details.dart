import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

Widget orderProductDetails({image,title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage("$image"),
          radius: 30,
        ),
        Column(

          children: [
            textWidget( "$title1", AppColors().blackColor, 16, FontWeight.bold),
            textWidget( "$d1", AppColors().redColor, 16, FontWeight.bold),
          ],
        ),
        SizedBox(
          width: 60,
          child: Column(
            children: [
              textWidget( "$title2", AppColors().blackColor, 16, FontWeight.bold),
              textWidget( "$d2", AppColors().redColor, 16, FontWeight.bold),
            ],
          ),
        ),
      ],
    ),
  );
}
