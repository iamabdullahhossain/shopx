import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/model/login_response_model/login_response_model.dart';
import 'package:shopx/repository/login_repository/login_repository.dart';
import 'package:shopx/res/routes/routes_name.dart';
import 'package:shopx/utils/app_utils.dart';
import 'package:shopx/view_model/controller/user_preferences_controller/user_preferences_controller.dart';

class LoginScreenController extends GetxController {
  /*----------------Necessary Class Objects---------------*/

  final _apiRepository = LoginRepository();
  final _userPreferences = UserPreferences();

/*  ---------------Necessary observable variables----------*/

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final usernameFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loadingState = false.obs;

  void userLogin() {
    loadingState.value = true;
    /* var data = jsonEncode({
      "username": usernameController.value.text,
      "password": passwordController.value.text
    });*/
    Map data = {
      "username": usernameController.value.text,
      "password": passwordController.value.text
    };

    _apiRepository.loginAPI(data).then((value) {
      loadingState.value = false;
      if (value != null) {
        LoginResponseModel model =
            LoginResponseModel(token: value["token"], isLoggedIn: true);

        _userPreferences
            .saveUser(model)
            .then((value) {
          Get.offNamed(RoutesName.homeScreen);
        }).onError((error, stackTrace) {});
      } else {
        AppUtils.showToast("authentication_error".tr);
      }
    }).onError((error, stackTrace) {
      loadingState.value = false;
      AppUtils.showToast("authentication_error".tr);
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
    });
  }
}
