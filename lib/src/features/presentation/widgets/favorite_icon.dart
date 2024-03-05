import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.favorite_outline,
        color: AppColors().redColor,
      ),
    );
  }
}
