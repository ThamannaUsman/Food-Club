import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/string.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/presentation/bloc/credential/credential_bloc.dart';
import 'package:food_club/src/features/presentation/widgets/custom_text_form_field.dart';
import 'package:food_club/src/features/presentation/widgets/elevated_button_widget.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    AppColors appColors= AppColors();
    Utils utils=Utils();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWidget(AppString.resetPassword,appColors.blackColor, 38,
              FontWeight.w800),
          const SizedBox(
            height: 30,
          ),
          textWidget(
              "Enter your email and we will send \nyou a password reset link",
              appColors.blackColor,
              18,
              FontWeight.w500),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: emailController,
              obscureText: false,
              type: TextInputType.emailAddress,
              text: AppString.email,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: appColors.blackColor,
              )),
          const SizedBox(
            height: 10,
          ),
          elevatedButtonWidget(AppString.resetPassword, () {
            if (emailController.text.isEmpty) {
              utils.flutterToast('Enter your email');
              return;
            }
            BlocProvider.of<CredentialBloc>(context)
                .add(ForgotPasswordEvent(email: emailController.text));
            utils.showSnackBar(
                context: context,
                content: "Password reset link sent! Check your email");
          })
        ],
      ),
    );
  }
}
