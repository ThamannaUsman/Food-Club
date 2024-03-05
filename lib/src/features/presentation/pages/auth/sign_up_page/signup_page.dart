
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AppColors appColors=AppColors();
  Utils utils=Utils();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool isShowPassword=true;

  @override
  void dispose() {
    _nameController.dispose();
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
            }
            if (state is CredentialError) {
              utils
                  .flutterToast(state.errorMessage);
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          textWidget(AppString.signUp, appColors.blackColor, 33,
              FontWeight.bold),
          SizedBox(
            height: 15.h,
          ),
          CustomTextFormField(
              controller: _nameController,
              obscureText: false,
              type: TextInputType.text,
              text: AppString.name,
              prefixIcon: Icon(
                Icons.person_outline,
                color: appColors.blackColor,
              )),
          CustomTextFormField(
              controller: _addressController,
              obscureText: false,
              type: TextInputType.text,
              text: AppString.address,
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: appColors.blackColor,
              )),
          CustomTextFormField(
              controller: _phoneNumberController,
              obscureText: false,
              type: TextInputType.number,
              text: AppString.phoneNumber,
              prefixIcon: Icon(
                Icons.numbers,
                color: appColors.blackColor,
              )),
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
            obscureText:isShowPassword ,
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
          elevatedButtonWidget(AppString.signUp, () {
            _signUp();
            // Navigator.pushNamed(context, otpPage);
          }),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, loginPage);
              },
              child: Text.rich(TextSpan(
                  text: "Already have an Account?  ",
                  style: TextStyle(color: appColors.greyColor),
                  children: [
                    TextSpan(
                        text: AppString.login,
                        style: TextStyle(color:appColors.blackColor))
                  ])))
        ],
      ),
    );
  }

  void _signUp() {
    if (_nameController.text.isEmpty &&
        _addressController.text.isEmpty&&
        _phoneNumberController.text.isEmpty&&
        _emailController.text.isEmpty &&
        _passwordController.text.isEmpty) {
      utils.flutterToast("Please fill up all the fields");
      return;
    }
    if (_nameController.text.isEmpty) {
      utils.flutterToast("Enter your name");
      return;
    }
    if (_addressController.text.isEmpty) {
      utils.flutterToast("Enter your address");
      return;
    }
    if (_phoneNumberController.text.isEmpty) {
      utils.flutterToast("Enter your phoneNumber");
      return;
    }

    if (_emailController.text.isEmpty) {
      utils.flutterToast("Enter your email");
      return;
    }
    if (_passwordController.text.isEmpty) {
      utils.flutterToast("Enter yoy password");
      return;
    }

    BlocProvider.of<CredentialBloc>(context).add(SignUpEvent(
        user: UserEntity(
      name: _nameController.text,
      address: _addressController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text,
      password: _passwordController.text,

    )));
  }
}
