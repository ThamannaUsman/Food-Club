import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/string.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';
import 'package:food_club/src/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/credential/credential_bloc.dart';
import 'package:food_club/src/features/presentation/pages/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:food_club/src/features/presentation/widgets/custom_text_form_field.dart';
import 'package:food_club/src/features/presentation/widgets/elevated_button_widget.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';
import 'package:food_club/src/routes/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppColors appColors = AppColors();
  Utils utils = Utils();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isShowPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.whiteColor,
        body: BlocConsumer<CredentialBloc, CredentialState>(
          listener: (context, state) {
            if (state is CredentialLoaded) {
              BlocProvider.of<AuthBloc>(context).add(LoggedInEvent());
            } else if (state is CredentialError) {
              utils.flutterToast(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is CredentialLoading) {
              return utils.loadingWidget();
            }
            if (state is CredentialLoaded) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthenticatedState) {
                    return BottomNavigationBarWidget(uid: state.uid);
                  } else {
                    return _bodyWidget();
                  }
                },
              );
            }
            return _bodyWidget();
          },
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(AppString.login, appColors.blackColor, 33, FontWeight.bold),
        SizedBox(
          height: 15.h,
        ),
        CustomTextFormField(
            controller: _emailController,
            obscureText: false,
            type: TextInputType.emailAddress,
            text: AppString.email,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: appColors.blackColor,
            )),
        CustomTextFormField(
          controller: _passwordController,
          obscureText: isShowPassword,
          type: TextInputType.text,
          text: AppString.password,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: appColors.blackColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isShowPassword = isShowPassword == false ? true : false;
              });
            },
            icon: Icon(
              isShowPassword == false ? Icons.visibility_off : Icons.visibility,
              color: appColors.blackColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, forgotPasswordPage);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topRight,
                child: textWidget(AppString.forgotPassword,
                   appColors.cyanColor, 14, FontWeight.normal)),
          ),
        ),
        elevatedButtonWidget(AppString.login, () {
          _logIn();
        }),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, signupPage);
            },
            child: Text.rich(TextSpan(
                text: "Don't have an Account? ",
                style: TextStyle(color: appColors.greyColor),
                children: [
                  TextSpan(
                      text: AppString.signUp,
                      style: TextStyle(color: appColors.blackColor))
                ])))
      ],
    );
  }

  void _logIn() {
    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      utils.flutterToast("Please fill up all the fields");
      return;
    }
    if (_emailController.text.isEmpty) {
      utils.flutterToast("Enter your email");
      return;
    }
    if (_passwordController.text.isEmpty) {
      utils.flutterToast("Enter your password");
      return;
    }
    return BlocProvider.of<CredentialBloc>(context).add(LoginEvent(
        user: UserEntity(
      email: _emailController.text,
      password: _passwordController.text,
    )));
  }
}
