import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/asset.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/constants/string.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/bloc/category/category_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:food_club/src/features/presentation/pages/home/category/categories.dart';
import 'package:food_club/src/features/presentation/pages/home/category/category_page.dart';
import 'package:food_club/src/features/presentation/pages/home/most_popular_view.dart';
import 'package:food_club/src/features/presentation/pages/home/recommended_view.dart';
import 'package:food_club/src/features/presentation/pages/home/search_screen.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/navigation_drawer.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';
import 'package:food_club/src/routes/routes_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<WishlistBloc>(context).add(GetWishlistDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CategoryBloc>(context);
    AppColors  appColors= AppColors();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appColors.whiteColor,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, cartPage);
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: appColors.blackColor,
                  ))
            ],
          ),
          drawer: const NavigationDrawerWidget(),
          body: StreamBuilder(
              stream: FirebaseService.getUser(auth.currentUser!.uid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Utils().loadingWidget();
                } else {
                  var data = snapshot.data!.docs[0];
                  return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Delivering to", appColors.blackColor26, 14,
                    FontWeight.normal),
                textWidget('${data['address']}',appColors.blackColor38, 16,
                    FontWeight.bold),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "What would you like \nto order",
                  style: TextStyle(
                    color: appColors.blackColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: () {
                          if (_searchController.text.isNotEmpty) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                title: _searchController.text,),));
                          }
                        }, icon: Icon(
                          Icons.search,
                          color: appColors.blackColor,
                        ),),
                        filled: true,
                        fillColor: appColors.whiteColor,
                        hintText: "Search Food",
                        hintStyle: TextStyle(
                            color:appColors.blackColor26, fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:appColors.blackColor, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: appColors.blackColor, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      categories(ImageAssets.allFood, AppString.all, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "All"),));
                        bloc.add(AllFoodEvent());
                      }),
                      categories(ImageAssets.indianFood, AppString.indian, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Indian Food"),));
                        bloc.add(IndianFoodEvent());
                      }),
                      categories(ImageAssets.chineseFood, AppString.chinese, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Chinese Food"),));
                        bloc.add(ChineseFoodEvent());
                      }),
                      categories(
                          ImageAssets.pakistaniFood, AppString.pakistani, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Pakistani Food"),));
                        bloc.add(PakistaniFoodEvent());
                      }),
                      categories(ImageAssets.italianFood, AppString.italian, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Italian Food"),));
                        bloc.add(ItalianFoodEvent());
                      }),
                      categories(ImageAssets.turkishFood, AppString.turkish, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Turkish Food"),));
                        bloc.add(TurkishFoodEvent());
                      }),
                      categories(ImageAssets.spanishFood,AppString.spanish, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Spanish Food"),));
                        bloc.add(SpanishFoodEvent());
                      }),
                      categories(ImageAssets.japaneseFood, AppString.japanese, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Japanese Food"),));
                        bloc.add(JapaneseFoodEvent());
                      }),

                      categories(ImageAssets.thaiFood, AppString.thai, () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                              text: "Thai Food"),));
                        bloc.add(ThaiFoodEvent());
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: textWidget("Most Popular", appColors.blackColor,
                      25, FontWeight.w800),
                ),
                const MostPopularView(),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: textWidget("Recommended", appColors.blackColor, 25,
                      FontWeight.w800),
                ),
                const RecommendedView()
              ],
            ),
          ),
        );
      }
    })),
    );
  }
}
