import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

Widget menuItem(String text, String image, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors().blackColor),
          borderRadius: BorderRadius.circular(12),
          color: AppColors().blackColor,
        ),
        child: Card(
          color: AppColors().blackColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(text, AppColors().whiteColor, 32, FontWeight.bold),
               CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 58,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
Widget menuItem2(String text, String image, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors().blackColor),
          borderRadius: BorderRadius.circular(12),
          color: AppColors().blackColor,
        ),
        child: Card(
          color: AppColors().blackColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 58,
                ),
                textWidget(text, AppColors().whiteColor, 34, FontWeight.bold),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
