import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';
import '../../../utils/app_utils.dart';
import '../../../view_model/controller/login_screen_controller/login_screen_controller.dart';

class InputUsernameWidget extends StatelessWidget {
  const InputUsernameWidget({
    super.key,
    required this.controller,
  });

  final LoginScreenController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: controller.usernameFocusNode.value,
      controller: controller.usernameController.value,
      validator: (value) {
        if (value!.isEmpty) {
          AppUtils.showToast("user_name_not_found".tr);
        }
      },
      onFieldSubmitted: (value) {
        AppUtils.fieldFocusChange(
            context,
            controller.usernameFocusNode.value,
            controller.passwordFocusNode.value);
      },
      cursorColor: AppColors.black,
      decoration: InputDecoration(
          labelText: "username_hint".tr,
          labelStyle: const TextStyle(color: AppColors.black),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5))),
    );
  }
}