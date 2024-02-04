

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/data/response/status.dart';
import 'package:shopx/model/user_information_model/user_information_model.dart';
import 'package:shopx/repository/products_repository/products_repository.dart';
import 'package:shopx/repository/user_repository/user_repository.dart';
import 'package:shopx/view_model/controller/user_preferences_controller/user_preferences_controller.dart';

import '../../../model/product_model/product_model.dart';
import '../../../res/routes/routes_name.dart';

class HomeScreenController extends GetxController {
  final _apiRepository = ProductsRepository();
  final _userApiRepository = UserRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final productList = <ProductModel>[].obs;
  final userInfoList = UserInformationModel().obs;
  RxString error = ''.obs;
  RxList favouriteList = [].obs;
  RxBool isListView = true.obs;


  addToFav(dynamic id) {
    favouriteList.add(id);
  }

  removeFromFav(dynamic id) {
    favouriteList.remove(id);
  }

  void setError(String _value) => error.value = _value;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setProductList(List<ProductModel> _value) => productList.value = _value;

  void setUserInformationList(UserInformationModel _value) =>
      userInfoList.value = _value;

  void getProductListAPI() {
    _apiRepository.getProductsAPI().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProductList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.FAILED);
      setError(error.toString());
      if (kDebugMode) {
        print(stackTrace);
      }
    });
  }

  void getUserInformation() async {
    _userApiRepository.getUserInformation().then((value) {
      setUserInformationList(value);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
      }
    });
  }

  void logout() {

    UserPreferences userPreferences = UserPreferences();
    userPreferences.removeUser().then((value) {
      Get.offNamed(RoutesName.loginScreen);
    });
  }
}
