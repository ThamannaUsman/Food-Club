import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/order/order_details.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    Utils utils = Utils();
    return Scaffold(
      backgroundColor: appColors.whiteColor,
      appBar: AppBar(
        backgroundColor: appColors.blackColor,
        title:
            textWidget('My Orders', appColors.whiteColor, 25, FontWeight.bold),
        iconTheme: IconThemeData(color: appColors.whiteColor),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseService.getOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return utils.loadingWidget();
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: textWidget(
                  "No orders yet!", appColors.whiteColor, 20, FontWeight.bold),
            );
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: textWidget("${index + 1}", appColors.blackColor87,
                      15, FontWeight.bold),
                  title: textWidget(data[index]['order_date'].toString(),
                      appColors.blackColor87, 14, FontWeight.bold),
                  subtitle: textWidget(data[index]['total_Price'].toString(),
                      appColors.blackColor87, 14, FontWeight.bold),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrdersDetails(
                                data: data[index],
                              ),
                            ));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: appColors.blackColor87,
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
