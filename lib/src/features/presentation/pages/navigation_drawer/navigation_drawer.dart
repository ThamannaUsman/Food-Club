import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/asset.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/services/firebase_service.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:food_club/src/features/presentation/widgets/list_title_widget.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';
import 'package:food_club/src/routes/routes_name.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    Utils utils=Utils();
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      width: 280,
      child: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: FirebaseService.getUser(auth.currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return utils.loadingWidget();
                  } else {
                    var data = snapshot.data!.docs[0];
                    return Container(
                      width: double.infinity,
                      color: appColors.blackColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const CircleAvatar(
                            radius: 52,
                            backgroundImage: AssetImage(ImageAssets.logo),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          textWidget('${data['name']}', appColors.whiteColor, 22,
                              FontWeight.bold),
                          textWidget('${data['email']}',
                              appColors.whiteColor, 16, FontWeight.normal),
                          SizedBox(
                            height: 14.h,
                          ),
                        ],
                      ),
                    );
                  }
                }),
            Container(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 16,
                children: [
                  listTitleWidget(
                      Icon(
                        Icons.delivery_dining_outlined,
                        color: appColors.blackColor,
                      ),
                      "Orders", () {
                 Navigator.pushNamed(context, orderPage);
                  }),
                  listTitleWidget(
                      Icon(
                        Icons.favorite_outlined,
                        color: appColors.blackColor,
                      ),
                      "Favourite", () {
                    BlocProvider.of<WishlistBloc>(context).add(GetWishlistDataEvent());
                    Navigator.pushNamed(context, favouritePage);
                  }),
                  listTitleWidget(
                      Icon(
                        Icons.list_alt_sharp,
                        color: appColors.blackColor,
                      ),
                      "About Us", () {
                    Navigator.pushNamed(context, aboutUs);
                  }),
                  listTitleWidget(
                      Icon(
                        Icons.logout,
                        color: appColors.blackColor,
                      ),
                      "Logout", () {
                    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
