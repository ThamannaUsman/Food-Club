import 'package:flutter/material.dart';

import 'package:food_club/src/core/constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String text;

  const CustomTextFormField(
      {super.key,
      required this.controller,
     required this.obscureText,
      required this.type,
      this.prefixIcon,
      this.suffixIcon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
      child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: type,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColors().whiteColor,
            hintText: text,
            hintStyle: const TextStyle(color: Colors.black26,fontSize: 16),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors().blackColor, width: 2),
                borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color:AppColors().blackColor26, width: 2),
                borderRadius: BorderRadius.circular(12)),
          )),
    );
  }
}
