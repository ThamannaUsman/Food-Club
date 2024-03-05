import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/pages/cart/cart_page.dart';
import 'package:food_club/src/features/presentation/pages/home/home_page.dart';
import 'package:food_club/src/features/presentation/pages/menu/menu_page.dart';


class BottomNavigationBarWidget extends StatefulWidget {
  final String uid;

  const BottomNavigationBarWidget({super.key, required this.uid});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;
  List<Widget> body = [
    const HomePage(),
    const MenuPage(),
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: appColors.whiteColor,
        unselectedItemColor: appColors.whiteColor24,
        backgroundColor: appColors.blackColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        ],
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
    );
  }
}
