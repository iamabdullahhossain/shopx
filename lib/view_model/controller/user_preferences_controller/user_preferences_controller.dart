import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopx/model/login_response_model/login_response_model.dart';

class UserPreferences {
  Future<bool> saveUser(LoginResponseModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", model.token.toString());
    sharedPreferences.setBool("isLoggedIn", model.isLoggedIn!);
    return true;
  }

  Future<LoginResponseModel> getUser() async {

    SharedPreferences sharedPreferences = await  SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    bool? isLoggedIn = sharedPreferences.getBool("isLoggedIn");

    return LoginResponseModel(token: token, isLoggedIn: isLoggedIn);
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    return true;
  }
}
