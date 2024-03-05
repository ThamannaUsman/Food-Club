import 'package:flutter/material.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/pages/home/category/category_details.dart';

class SearchScreen extends StatelessWidget {
  final String? title;

  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    AppColors  appColors= AppColors();
    return Scaffold(
        backgroundColor: appColors.whiteColor,
        appBar: AppBar(
          backgroundColor: appColors.transparent,
          title: Text(
            title!,
            style: TextStyle(color: appColors.blackColor),
          ),
        ),
        body: FutureBuilder(
          future: FirebaseService.searchProducts(title),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Utils().loadingWidget();
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text(
                "Not food found",
              ));
            } else {
              var data = snapshot.data!.docs;
              var items = data
                  .where((element) => element['name']
                      .toString()
                      .toLowerCase()
                      .contains(title!.toLowerCase()))
                  .toList();

              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 250),
                    children: List.generate(items.length, (index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CategoryDetails(
                                      name: items[index]['name'],
                                      image: items[index]['image'],
                                      price: items[index]['price'],
                                      time: items[index]['time'],
                                      calories: items[index]['calories'],
                                      rating:items[index]['rating'],
                                      desc: items[index]['desc'],
                                      id: items[index]['id']);
                                },
                              ));
                            },
                            child: Container(
                              color: appColors.whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      items[index]['image'],
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${items[index]['name']}",
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
                                    ' \₹' + "${items[index]['price']}",
                                    style: TextStyle(
                                        color: appColors.redAccentColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ));
            }
          },
        ));
  }
}
