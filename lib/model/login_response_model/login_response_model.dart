class LoginResponseModel {
  String? token;
  bool? isLoggedIn;

  LoginResponseModel({this.token, this.isLoggedIn});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLoggedIn = json['isLoggedIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    data['isLoggedIn'] = this.isLoggedIn;
    return data;
  }
}
