import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:food_club/src/features/presentation/pages/home/category/category_details.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return Scaffold(
      backgroundColor: appColors.whiteColor,
      appBar: AppBar(
        backgroundColor: appColors.blackColor,
        title: Text(
          'Wishlist',
          style: TextStyle(
              color:appColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        iconTheme: IconThemeData(color: AppColors().whiteColor),
        centerTitle: true,
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Utils().loadingWidget();
          } else if (state is WishlistLoaded) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 250),
                  children: List.generate(state.wishlistEntity.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        final data = state.wishlistEntity[index];
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
                      child: Column(
                        children: [
                          Container(
                            color: AppColors().whiteColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    state.wishlistEntity[index].image,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.wishlistEntity[index].name,
                                  style:  TextStyle(
                                    color: appColors.blackColor87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  ' \₹' +
                                      "${state.wishlistEntity[index].price}",
                                  style: TextStyle(
                                      color: appColors.redAccentColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ));
          } else if (state is WishlistError) {
            return Utils()
                .showSnackBar(context: context, content: state.errorMessage);
          } else {
            return Center(child: textWidget('Empty',appColors.blackColor , 18, FontWeight.w500));
          }
        },
      ),
    );
  }
}
