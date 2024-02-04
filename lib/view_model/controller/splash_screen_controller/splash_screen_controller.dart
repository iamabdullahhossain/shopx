import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopx/res/routes/routes_name.dart';
import 'package:shopx/view_model/controller/user_preferences_controller/user_preferences_controller.dart';

class SplashScreenController extends GetxController {
  final UserPreferences userPreferences = UserPreferences();

  void toLoginPage() {
    userPreferences.getUser().then((value) {
      if (kDebugMode) {
        print("token: ${value.token}");
        print("isLoggedIn: ${value.isLoggedIn}");
      }
      if (value.isLoggedIn == false || value.isLoggedIn.toString() == "null") {
        Timer(const Duration(seconds: 3),
            () => Get.offNamed(RoutesName.loginScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.offNamed(RoutesName.homeScreen));
      }
    }).onError((error, stackTrace) {});

    /*   Timer(
        const Duration(seconds: 3), () => Get.offNamed(RoutesName.loginScreen));*/
  }
}
