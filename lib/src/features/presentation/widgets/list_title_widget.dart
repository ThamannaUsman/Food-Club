import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';


Widget listTitleWidget(Widget icon,String text,void Function()? onTap){
  return ListTile(
    leading: icon,
    title: Text(text,style: TextStyle(color: AppColors().blackColor),),
    onTap: onTap,
  );
}