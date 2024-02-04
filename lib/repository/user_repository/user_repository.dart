import 'dart:convert';

import 'package:shopx/model/user_information_model/user_information_model.dart';
import 'package:shopx/res/app_urls/app_urls.dart';

import '../../data/network/network_api_services.dart';

class UserRepository {
  final _apiService = NetworkApiServices();

  Future<UserInformationModel> getUserInformation() async {
    dynamic response = await _apiService.getApi(AppUrls.userInformationAPI);
    return UserInformationModel.fromJson( response);
  }
}
