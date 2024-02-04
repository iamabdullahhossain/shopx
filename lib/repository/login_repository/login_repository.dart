import 'package:shopx/data/network/network_api_services.dart';
import 'package:shopx/res/app_urls/app_urls.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginAPI(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrls.userLoginAPI);
    return response;
  }
}
