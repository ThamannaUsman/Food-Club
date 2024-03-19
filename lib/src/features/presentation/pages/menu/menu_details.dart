import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';
import 'package:food_club/src/features/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';


class MenuDetails extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final int time;
  final String calories;
  final double rating;
  final String desc;
  final String id;

  const MenuDetails(
      {super.key,
        required this.name,
        required this.image,
        required this.price,
        required this.time,
        required this.calories,
        required this.rating,
        required this.desc,
        required this.id});

  @override
  State<MenuDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<MenuDetails> {
  int total = 0;
  int a = 0;

  List<String> wishlistId = [];

  @override
  void initState() {
    total=int.parse(total.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppColors  appColors= AppColors();
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.blackColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_backspace_outlined,
              color:appColors.whiteColor,
            ),
          ),
          backgroundColor: appColors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Share.share(
                    "${widget.name}\n${widget.image}\n'₹'${widget.price}");
              },
              icon: Icon(
                Icons.share,
                color: appColors.whiteColor,
              ),
            ),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {

                final isWishlist =
                context.watch<WishlistBloc>().wishlistId.contains(widget.id);
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
                                  id: widget.id,
                                  image: widget.image,
                                  price: widget.price,
                                  name: widget.name,
                                  time: widget.time,
                                  desc: widget.desc,
                                  rating: widget.rating,
                                  calories: widget.calories),
                            ));
                      } else {
                        BlocProvider.of<WishlistBloc>(context)
                            .add(AddToWishlistEvent(
                          wishlistEntity: WishlistEntity(
                            id: widget.id,
                            image: widget.image,
                            price: widget.price,
                            name: widget.name,
                            time: widget.time,
                            desc: widget.desc,
                            rating: widget.rating,
                            calories: widget.calories,
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
                      color: appColors.whiteColor,
                    ));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  widget.image,
                  width: 360.w,
                  height: 280.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 9.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: textWidget(widget.name,appColors.whiteColor, 22,
                          FontWeight.w600)),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: textWidget('₹' + '${widget.price}',
                          appColors.redAccentColor, 18, FontWeight.w500)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lock_clock_outlined,
                            color: appColors.redColorShade800,
                          ),
                        ),
                        textWidget('${widget.time} Min', appColors.whiteColor,
                            15, FontWeight.w400)
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.local_fire_department_outlined,
                            color: appColors.orangeAccentColor,
                          ),
                        ),
                        textWidget('${widget.calories} Kcal',
                            AppColors().whiteColor, 15, FontWeight.w400)
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star,
                              color: appColors.amberAccentColor),
                        ),
                        textWidget('${widget.rating}', appColors.whiteColor,
                            15, FontWeight.w400)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                ReadMoreText(
                  widget.desc,
                  lessStyle: TextStyle(
                      color: appColors.greyColor,
                      fontWeight: FontWeight.normal),
                  moreStyle: TextStyle(
                      color: appColors.greyColor,
                      fontWeight: FontWeight.normal),
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: TextStyle(fontSize: 15, color: appColors.whiteColor),
                  trimLines: 4,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  color: appColors.whiteColor24,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                appColors.whiteColor24),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: textWidget("Total:  " + '₹' + '$total',
                            appColors.whiteColor, 18, FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            side: MaterialStateProperty.all(
                                BorderSide(color: appColors.whiteColor))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (a > 0) {
                                  --a;
                                  total = total -
                                      int.parse(widget.price.toString());
                                  setState(() {});
                                }
                              },
                              child: Icon(Icons.remove,color: appColors.whiteColor,size: 18),
                            ),
                            textWidget('$a', AppColors().greyColor, 18,
                                FontWeight.w700),
                            GestureDetector(
                                onTap: () {
                                  ++a;
                                  total =
                                      total + int.parse(widget.price.toString());
                                  setState(() {});
                                },
                                child: Icon(Icons.add,color: appColors.whiteColor,size: 18,)
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                          cartEntity: CartEntity(
                              image: widget.image,
                              name: widget.name,
                              price: widget.price,
                              quantity: a,
                              totalPrice: total,
                              addedBy: authentication.currentUser!.uid)));
                      Utils().flutterToast('Add to Cart');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(appColors.whiteColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    child: textWidget("Add To Cart", appColors.blackColor87,
                        20, FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}