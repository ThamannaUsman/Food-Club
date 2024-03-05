import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

Widget categories(String image, String text, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
        height: 140,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 43,
              ),
              SizedBox(
                height: 3.h,
              ),
              textWidget(text, AppColors().blackColor, 14, FontWeight.w700)
            ],
          ),
        )),
  );
}

