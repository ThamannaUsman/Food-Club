import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/core/constants/string.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';
import 'package:food_club/src/features/presentation/bloc/credential/credential_bloc.dart';
import 'package:food_club/src/features/presentation/widgets/custom_text_form_field.dart';
import 'package:food_club/src/features/presentation/widgets/elevated_button_widget.dart';
import 'package:food_club/src/features/presentation/widgets/text_widget.dart';

class DeliveryDetails extends StatelessWidget {
  final dynamic data;
  const DeliveryDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _addressController = TextEditingController();
    final _phoneNumberController = TextEditingController();
    _nameController.text=data['name'];
    _addressController.text=data['address'];
    _phoneNumberController.text=data['phoneNumber'];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWidget(
              'Fill the Details', AppColors().blackColor, 25, FontWeight.bold),
          CustomTextFormField(
              controller: _nameController,
              obscureText: false,
              type: TextInputType.text,
              text: AppString.name),
          CustomTextFormField(
              controller: _addressController,
              obscureText: false,
              type: TextInputType.text,
              text: AppString.address),
          CustomTextFormField(
              controller: _phoneNumberController,
              obscureText: false,
              type: TextInputType.number,
              text: AppString.phoneNumber),
          elevatedButtonWidget('Change', () {
            BlocProvider.of<CredentialBloc>(context).add(UpdateUserDetailsEvent(user: UserEntity(
              name: _nameController.text,
              address: _addressController.text,
              phoneNumber: _phoneNumberController.text
            )));
            Utils().showSnackBar(context: context, content: 'Updated');
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
