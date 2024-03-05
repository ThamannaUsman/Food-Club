import 'package:flutter/material.dart';
import 'package:food_club/src/features/presentation/pages/auth/login_page/forgot_password_page/forgot_password_page.dart';
import 'package:food_club/src/features/presentation/pages/auth/login_page/login_page.dart';
import 'package:food_club/src/features/presentation/pages/auth/sign_up_page/signup_page.dart';
import 'package:food_club/src/features/presentation/pages/cart/cart_page.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/about_us/about_us.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/order/order_page.dart';
import 'package:food_club/src/features/presentation/pages/navigation_drawer/wishlist/wishlist_page.dart';
import 'package:food_club/src/routes/routes_name.dart';


Route<dynamic> controller(RouteSettings settings){
  switch(settings.name){
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case signupPage:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case forgotPasswordPage:
      return MaterialPageRoute(builder: (context) => const ForgotPasswordPage());
    case orderPage:
      return MaterialPageRoute(builder: (context) => const OrderPage());
    case favouritePage:
      return MaterialPageRoute(builder: (context) => const WishlistPage());
    case aboutUs:
      return MaterialPageRoute(builder: (context) => const AboutUs());
    case cartPage:
      return MaterialPageRoute(builder: (context) => const CartPage());
    default:
    throw('This route name does not exist');

  }
}