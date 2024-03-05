import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/string.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.blackColor,
          title: textWidget(
              'About Us', appColors.whiteColor, 25, FontWeight.bold),
          iconTheme: IconThemeData(color: appColors.whiteColor),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(AppString.firstPara, appColors.blackColor,
                    17, FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(AppString.secondPara, appColors.blackColor,
                    17, FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(AppString.thirdPara, appColors.blackColor,
                    17, FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(AppString.fourthPara, appColors.blackColor,
                    17, FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(AppString.fiftyPara, appColors.blackColor,
                    17, FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(AppString.sixtyPara, appColors.blackColor,
                    17, FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
