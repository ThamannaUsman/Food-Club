import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/asset.dart';
import 'package:food_club/src/core/constants/string.dart';
import 'package:food_club/src/features/presentation/bloc/menu/menu_bloc.dart';
import 'package:food_club/src/features/presentation/pages/menu/menu.dart';
import 'package:food_club/src/features/presentation/pages/menu/menu_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MenuBloc>(context);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                    children: [
                      menuItem(AppString.veg, ImageAssets.veg, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu(text: "Veg"),));
                        bloc.add(VegFoodEvent());
                      }),
                      menuItem2(AppString.nonVeg, ImageAssets.nonVeg, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu(text: "Non Veg"),));
                        bloc.add(NonVegFoodEvent());
                      }),
                      menuItem(AppString.sideDish, ImageAssets.sideDish, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu(text: "Side Dish"),));
                        bloc.add(SideDishEvent());
                      }),
                      menuItem2(AppString.dessert, ImageAssets.dessert, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu(text: "Dessert"),));
                        bloc.add(DessertEvent());
                      }),
                      menuItem(AppString.iceCream, ImageAssets.iceCream, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu(text: "Ice Cream"),));
                        bloc.add(IceCreamEvent());
                      }),
                      menuItem2(AppString.drinks, ImageAssets.drinks, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu(text: "Drinks"),));
                        bloc.add(DrinksEvent());
                      }),

                    ],
                  ),
            )));
  }
}
