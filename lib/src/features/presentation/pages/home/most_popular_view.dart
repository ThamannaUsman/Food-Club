import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:food_club/src/features/presentation/pages/home/category/category_details.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class MostPopularView extends StatelessWidget {
  const MostPopularView({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors  appColors= AppColors();
    return SizedBox(
      height: 225,
      child: FutureBuilder(
          future: FirebaseService.getMostProduct(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Utils().loadingWidget();
            } else if (snapshot.data!.docs.isEmpty) {
              return  Center(
                  child: Text("No Most Popular products",
                      style: TextStyle(
                        color: appColors.whiteColor,
                      )));
            } else {
              var data = snapshot.data!.docs;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryDetails(
                            name: data[index]['name'],
                            image: data[index]['image'],
                            price: data[index]['price'],
                            time: data[index]['time'],
                            calories: data[index]['calories'],
                            rating: data[index]['rating'],
                            desc: data[index]['desc'],
                            id: data[index]['id'],
                          );
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 100,
                      width: 250,
                      child: Card(
                        color: appColors.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                width: 2, color: appColors.blackColor87)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.network(
                                data[index]['image'],
                                width: 300,
                                height: 130,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  textWidget(
                                      data[index]['name'],
                                      appColors.blackColor,
                                      16,
                                      FontWeight.w700),
                                  BlocBuilder<WishlistBloc, WishlistState>(
                                    builder: (context, state) {

                                      final isWishlist =
                                      context.read<WishlistBloc>().wishlistId.contains(data[index]['id']);
                                      if (state is WishlistLoading) {
                                        return const CircularProgressIndicator();
                                      } else if (state is WishlistError) {
                                        return Utils().showSnackBar(
                                            context: context, content: state.errorMessage);
                                      }
                                      return IconButton(

                                          onPressed: () {

                                            if (isWishlist) {
                                              BlocProvider.of<WishlistBloc>(context).add(
                                                  RemoveToWishlistEvent(
                                                    wishlistEntity: WishlistEntity(
                                                        id: data[index]['id'],
                                                        image: data[index]['image'],
                                                        price: data[index]['price'],
                                                        name: data[index]['name'],
                                                        time: data[index]['time'],
                                                        desc: data[index]['desc'],
                                                        rating: data[index]['rating'],
                                                        calories: data[index]['calories']),
                                                  ));
                                            } else {
                                              BlocProvider.of<WishlistBloc>(context)
                                                  .add(AddToWishlistEvent(
                                                wishlistEntity: WishlistEntity(
                                                  id: data[index]['id'],
                                                  image: data[index]['image'],
                                                  price: data[index]['price'],
                                                  name: data[index]['name'],
                                                  time: data[index]['time'],
                                                  desc:data[index]['desc'],
                                                  rating: data[index]['rating'],
                                                  calories: data[index]['calories'],
                                                ),
                                              ));
                                            }
                                          },
                                          icon: isWishlist
                                              ?  Icon(
                                            Icons.favorite,
                                            color: appColors.redColor,
                                          )
                                              :  Icon(
                                            Icons.favorite_outline,
                                            color: appColors.redColor,
                                          ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 11, right: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star,size: 15,color: appColors.amberAccentColor,),
                                      textWidget(
                                          "${data[index]['rating']}",
                                          appColors.greyColorShade900,
                                          14, FontWeight.normal),
                                    ],
                                  ),
                                  textWidget(
                                      '₹' + "${data[index]['price']}",
                                      appColors.redAccentColor,
                                      17,
                                      FontWeight.w600),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
