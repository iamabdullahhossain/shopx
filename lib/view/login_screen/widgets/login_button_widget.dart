import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';
import '../../../view_model/controller/login_screen_controller/login_screen_controller.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final LoginScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SizedBox(
        height: 60,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              controller.userLogin();
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black),
          child: controller.loadingState.value
              ? const CircularProgressIndicator(color: AppColors.white,)
              : Text("login_now".tr),
        )) );

  }
}