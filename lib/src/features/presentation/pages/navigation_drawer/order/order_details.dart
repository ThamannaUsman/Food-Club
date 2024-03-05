import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/order/widget/order_amount_details.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/order/widget/order_product_details.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';



class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return Scaffold(
      backgroundColor: AppColors().whiteColor,
      appBar: AppBar(
        backgroundColor: appColors.transparent,
        title:
        textWidget('Order Details', appColors.blackColor, 24, FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(

                    border: Border.all(color: appColors.blackColor45)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        textWidget( "Order Date:", appColors.blackColor, 15, FontWeight.w700),
                        textWidget(data['order_date'], appColors.blackColor87, 13, FontWeight.w800),
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        textWidget("Payment Method:", appColors.blackColor, 15, FontWeight.w700),
                        textWidget( data['paymentMethod'], appColors.blackColor87, 13, FontWeight.w800),
                      ],),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget("Shipping Address:-", appColors.blackColor, 15, FontWeight.bold),
                              const SizedBox(height: 3,),
                              textWidget("${data['name']}",appColors.blackColor54, 13, FontWeight.w400),
                              textWidget( "${data['address']}", appColors.blackColor54, 13, FontWeight.w400),
                              textWidget( "${data['phoneNumber']}", appColors.blackColor54, 13, FontWeight.w400),

                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 10,),
              textWidget( "Order Product", AppColors().blackColor87, 19, FontWeight.bold),
              const SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(

                    border: Border.all(color: appColors.blackColor45)
                ),
                margin: const EdgeInsets.only(bottom: 4),
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data['order'].length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          orderProductDetails(
                            image:data['order'][index]['image'] ,
                              title1: data['order'][index]['name'],
                              title2:'\₹' + "${data['order'][index]['price']}",
                              d1: "${data['order'][index]['quantity']}x",
                            d2:  '\₹' + "${data['order'][index]['totalPrice']}",

                          ),

                        ],
                      );
                    }).toList()
                ),
              ),
              textWidget( "Order Amount", appColors.blackColor87, 19, FontWeight.bold),

              const SizedBox(height: 10,),
              Container(

                decoration: BoxDecoration(

                    border: Border.all(color: appColors.blackColor45)
                ),
                margin: const EdgeInsets.only(bottom: 4),
                child:Column(
                  children: [
                  orderAmountDetails(name: "Sub Total Amount",price:  "${data['subTotalPrice']}" ),
                    orderAmountDetails(name: "Delivery Fee",price:  "${data['delivery_fee']}" ),
                    orderAmountDetails(name:  "Total Amount",price:  "${data['total_Price']}" ),
                  ],
                )
              )
            ],
          ),))
    );
  }
}



