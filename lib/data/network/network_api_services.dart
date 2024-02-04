import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exception/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJSON;
    try {
      final response =
          await http.get(Uri.parse(url),);

      responseJSON = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }

    return responseJSON;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    if (kDebugMode) {
      print("Inserted Data: $data");
      print("URL : $url");
    }

    dynamic responseJSON;
    try {
      final response = await http
          .post(Uri.parse(url),
              body:
                  data) //if the data is a form data then it will be jsonEncoded. Else it will be raw.
          .timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);

      if (kDebugMode) {
        print("Status Code: ${response.statusCode}");
      }
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on TimeoutException {
      throw TimeOutException();
    }

    if (kDebugMode) {
      print("Response from request: $responseJSON");
    }

    return responseJSON;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJSON = jsonDecode(response.body);
        return responseJSON;
      case 400:
        throw InputDataException();
      default:
        throw FetchDataException();
    }
  }
}
