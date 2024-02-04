import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';
import '../../../utils/app_utils.dart';
import '../../../view_model/controller/login_screen_controller/login_screen_controller.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    super.key,
    required this.controller,
  });

  final LoginScreenController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: controller.passwordFocusNode.value,
        controller: controller.passwordController.value,
        cursorColor: AppColors.black,
        validator: (value) {
          if (value!.isEmpty) {
            AppUtils.showToast("password_not_found".tr);
          }
        },
        decoration: InputDecoration(
            labelText: "password_hint".tr,
            labelStyle: const TextStyle(color: AppColors.black),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
  }
}
