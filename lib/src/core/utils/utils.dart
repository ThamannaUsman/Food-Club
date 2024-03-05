import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_club/src/core/constants/color.dart';

class Utils {
  void flutterToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        backgroundColor: AppColors().blackColor,
        textColor: AppColors().whiteColor,
        timeInSecForIosWeb: 4,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 15);
  }

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors().blackColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content,
                style: TextStyle(
                  color: AppColors().whiteColor,
                )),
          ],
        )));
  }

  loadingWidget() {
   return Center(
        child: CircularProgressIndicator(
      color: AppColors().blackColor,
    ));
  }
}
