
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/pages/cart/confirm_order.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    Utils utils=Utils();
    int deliveryFee = 50;
    return Scaffold(
      backgroundColor: appColors.greyShadeColor200,
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
        backgroundColor: AppColors().blackColor,
        title: textWidget('Cart', appColors.whiteColor, 25, FontWeight.bold),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseService.getCart(authentication.currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return utils.loadingWidget();
            } else if (snapshot.data!.docs.isEmpty) {
              return  Center(
                child: Text(
                  "Cart is empty",
                  style: TextStyle(color:appColors.blackColor87),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              subTotalCalculate(data);
              itemsSnapshot = data;

              return SizedBox(
                height: 900,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  FirebaseService.deleteDocument(data[index].id);
                                },
                                backgroundColor:
                                appColors.greyShadeColor200,
                                foregroundColor:
                                appColors.redColorShade800,
                                icon: Icons.delete,
                                label: 'Delete',
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ]),
                        child: Container(
                          width: 400,
                          height: 100,
                          decoration: BoxDecoration(
                              color: appColors.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: appColors.blackColor, width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    // Border width
                                    decoration:  BoxDecoration(
                                        color: appColors.blackColor87,
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(40),
                                        // Image radius
                                        child: Image.network(
                                            "${data[index]['image']}",
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ),
                                textWidget(
                                    "${data[index]['name']}  (x${data[index]['quantity']})",
                                    appColors.blackColor,
                                    17,
                                    FontWeight.w700),
                                textWidget(
                                    '\₹' + "${data[index]['totalPrice']}",
                                    appColors.blackColor,
                                    18,
                                    FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
      bottomNavigationBar: StreamBuilder<Object>(
          stream: FirebaseService.getCart(authentication.currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return utils.loadingWidget();
            } else if (snapshot.data!.docs.isEmpty) {
              return  Center(
                child: Text(
                  "Cart is empty",
                  style: TextStyle(color: appColors.blackColor87),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              subTotalCalculate(data);
              itemsSnapshot = data;
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 108,
                  decoration: BoxDecoration(
                      color: appColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: appColors.blackColor, width: 2)),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget("Subtotal:", appColors.blackColor, 16,
                                FontWeight.w700),
                            textWidget('\₹' + '${subTotal}',
                                appColors.blackColor, 16, FontWeight.w400)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget("Delivery Fee:", AppColors().blackColor,
                                16, FontWeight.w700),
                            textWidget('\₹' + '${deliveryFee}',
                                appColors.blackColor, 16, FontWeight.w400)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                                "Total:  " + '₹' + '${subTotal + deliveryFee}',
                                AppColors().redColorShade800,
                                18,
                                FontWeight.w500),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      appColors.blackColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  )),
                                ),
                                onPressed: () {
                                  getProductDetails();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ConfirmOrder(
                                          subTotalPrice: subTotal,
                                          deliveryFee: deliveryFee,
                                          totalPrice: subTotal + deliveryFee,
                                          orders: FieldValue.arrayUnion(items),
                                        ),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Order Now",
                                      style: TextStyle(
                                          color: appColors.whiteColor),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: appColors.whiteColor,
                                      size: 15,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
