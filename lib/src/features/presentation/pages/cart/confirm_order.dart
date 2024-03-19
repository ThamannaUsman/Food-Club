
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/data/model/payment_model.dart';
import 'package:food_club/src/features/domain/entities/order_entity.dart';
import 'package:food_club/src/features/presentation/bloc/order/order_bloc.dart';
import 'package:food_club/src/features/presentation/pages/cart/delivery_details.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';
import 'package:food_club/src/routes/routes_name.dart';

class ConfirmOrder extends StatelessWidget {
  final int subTotalPrice;
  final int deliveryFee;
  final int totalPrice;
  final dynamic orders;

  const ConfirmOrder({
    super.key,
    required this.subTotalPrice,
    required this.deliveryFee,
    required this.totalPrice,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectMethod = ValueNotifier(0);
    AppColors appColors=AppColors();
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.greyShadeColor200,
        appBar: AppBar(
          title: Text(
            'Order',
            style: TextStyle(
              color: appColors.whiteColor,
            ),
          ),
          iconTheme: IconThemeData(color: AppColors().whiteColor),
          backgroundColor: appColors.blackColor,
        ),
        body: StreamBuilder(
            stream: FirebaseService.getUser(authentication.currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Utils().loadingWidget();
              } else {
                var data = snapshot.data!.docs[0];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 147,
                          decoration:
                          BoxDecoration(color: appColors.whiteColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: textWidget(
                                          'Delivery Details',
                                          appColors.blackColor,
                                          17,
                                          FontWeight.w700),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DeliveryDetails(
                                                    data: data,
                                                  ),
                                            ));
                                      },
                                      child: textWidget(
                                          'Change',
                                          appColors.redColorShade700,
                                          15,
                                          FontWeight.w500),
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: textWidget(
                                      '${data['name']}',
                                      appColors.blackColor38,
                                      14,
                                      FontWeight.w400),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: textWidget(
                                      '${data['address']}',
                                      appColors.blackColor38,
                                      14,
                                      FontWeight.w400),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: textWidget(
                                      '${data['phoneNumber']}',
                                      appColors.blackColor38,
                                      14,
                                      FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 220,
                          decoration:
                          BoxDecoration(color: appColors.whiteColor),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: textWidget(
                                      'Payment Method:-',
                                      appColors.blackColor,
                                      20,
                                      FontWeight.bold),
                                ),
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: payment.length,
                                  itemBuilder: (context, index) {
                                    return ValueListenableBuilder(
                                        valueListenable: selectMethod,
                                        builder: (context, value, child) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                textWidget(
                                                    payment[index].name,
                                                    appColors.blackColor,
                                                    18,
                                                    FontWeight.w600),
                                                InkWell(
                                                  onTap: () {
                                                   selectMethod.value=payment[index].id;

                                                  },
                                                  child: Icon(
                                                   payment[index].id == value
                                                        ? Icons.radio_button_on
                                                        : Icons
                                                        .radio_button_off,
                                                    color: appColors
                                                        .blackColor87,
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                    );
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration:
                          BoxDecoration(color: AppColors().whiteColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    textWidget(
                                        'Sub Total',
                                        appColors.blackColor,
                                        15,
                                        FontWeight.w500),
                                    textWidget(
                                        '\₹' + '$subTotalPrice',
                                        appColors.blackColor,
                                        18,
                                        FontWeight.w700)
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    textWidget(
                                        'Delivery Fee',
                                        appColors.blackColor,
                                        15,
                                        FontWeight.w500),
                                    textWidget(
                                        '${deliveryFee}',
                                        appColors.blackColor,
                                        18,
                                        FontWeight.w700)
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Divider(
                                  color: appColors.greyShadeColor200,
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    textWidget('Total', appColors.blackColor,
                                        19, FontWeight.bold),
                                    textWidget(
                                        '\₹' + '${totalPrice}',
                                        appColors.redColor,
                                        20,
                                        FontWeight.w700)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: appColors.greyShadeColor200,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
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
                              BlocProvider.of<OrderBloc>(context).add(
                                OrderConfirmEvent(
                                  orderEntity: OrderEntity(
                                      subTotalPrice: subTotalPrice,
                                      deliveryFee: deliveryFee,
                                      totalPrice: totalPrice,
                                      name: data['name'].toString(),
                                      address: data['address'].toString(),
                                      phoneNumber: data['phoneNumber'].toString(),
                                      paymentMethod: payment[selectMethod.value].name,
                                      orders: orders,
                                      orderBy: authentication.currentUser!.uid,
                                      orderDate: formattedDate
                                  ),
                                ),
                              );
                              clearCart();
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.leftSlide,
                                headerAnimationLoop: false,
                                dialogType: DialogType.success,
                                title: 'Order Successfully',
                                desc:
                                "We're Thrilled to Have Served You – Thank You for Ordering",
                                // desc:
                                // 'Order Successfully',
                                btnOkOnPress: () {
                                  Navigator.pushNamed(context, orderPage);
                                },
                                btnOkIcon: Icons.check_circle,
                              ).show();
                            },
                            child: Text(
                              "Confirm Order",
                              style: TextStyle(color:appColors.whiteColor),
                            ))
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
