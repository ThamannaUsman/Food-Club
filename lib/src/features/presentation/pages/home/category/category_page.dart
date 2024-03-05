import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/bloc/category/category_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:food_club/src/features/presentation/pages/home/category/category_details.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';
import 'package:food_club/src/routes/routes_name.dart';

class CategoryPage extends StatefulWidget {
  final String text;

  const CategoryPage({super.key, required this.text});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    AppColors  appColors= AppColors();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_backspace_outlined,
              color: appColors.whiteColor,
            ),
          ),
          title: Text(
            widget.text,
            style: TextStyle(color: appColors.whiteColor),
          ),
          centerTitle: true,
          backgroundColor: appColors.blackColor,
          actions: [
            IconButton(
              onPressed: () {
                 BlocProvider.of<WishlistBloc>(context).add(GetWishlistDataEvent());
               Navigator.pushNamed(context, favouritePage);
              },
              icon: Icon(
                Icons.favorite,
                color: appColors.redColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, cartPage);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: appColors.whiteColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if(state is CategoryLoading){
                  return Utils().loadingWidget();
                }
               else if (state is CategoryLoaded) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.category.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 13,
                      mainAxisExtent: 205,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final data = state.category[index];
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CategoryDetails(
                                name: data.name,
                                image: data.image,
                                price: data.price,
                                time: data.time,
                                calories: data.calories,
                                rating: data.rating,
                                desc: data.desc,
                                id: data.id,
                              );
                            },
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border:
                                  Border.all(color: appColors.blackColor, width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  // Border width
                                  decoration: BoxDecoration(
                                      color: appColors.blackColor87,
                                      shape: BoxShape.circle),
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(60),
                                      // Image radius
                                      child: Image.network(
                                          state.category[index].image,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textWidget(
                                        state.category[index].name,
                                        appColors.blackColor,
                                        16,
                                        FontWeight.bold),
                                    textWidget(
                                        '₹' + "${state.category[index].price}",
                                        appColors.redAccentColor,
                                        17,
                                        FontWeight.w600)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }else if(state is CategoryError){
                 return Utils().showSnackBar(context: context, content: state.errorMessage);
                }else{
                 return textWidget('Empty', appColors.blackColor, 18, FontWeight.bold);
                }

              },
            ),
          ),
        ),
      ),
    );
  }
}
