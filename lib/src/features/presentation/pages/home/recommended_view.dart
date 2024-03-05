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

class RecommendedView extends StatefulWidget {
  const RecommendedView({super.key});

  @override
  State<RecommendedView> createState() => _RecommendedViewState();
}

class _RecommendedViewState extends State<RecommendedView> {
  List<String> wishlistId = [];
  @override
  Widget build(BuildContext context) {
    AppColors  appColors= AppColors();
    return FutureBuilder(
        future:FirebaseService.getRecommendedProduct(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Utils().loadingWidget();
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No Recommended products",
                style: TextStyle(color: appColors.whiteColor,)));
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 110,
                ),
                itemBuilder: (context, index) {
                  // getItem(index,data);
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(data[index]['image']),
                              radius: 50,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              textWidget(
                                  data[index]['name'], appColors.blackColor,
                                  16, FontWeight.bold),
                              Row(
                                children: [
                                  Icon(Icons.star,size: 15,color: AppColors().amberAccentColor,),
                                  textWidget(
                                      "${data[index]['rating']}",
                                      appColors.greyColorShade900,
                                      14, FontWeight.normal),
                                ],
                              ),
                              textWidget('₹' + "${data[index]['price']}",
                                  appColors.redAccentColor, 17, FontWeight.w600)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}


