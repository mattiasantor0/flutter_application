import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/common/costants.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/mainPage.dart';
import 'package:flutter_application/service/login/loginService.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Dio dio = Dio()
    ..options.baseUrl = 'https://www.zerpy.it/demo/api/rest'
    ..options.connectTimeout = const Duration(seconds: 5)
    ..options.receiveTimeout = const Duration(seconds: 3)
    ..interceptors.add(TokenInterceptor());



    class TokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
         final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken= prefs.getString('accessToken');
    if (accessToken == null) {
      return super.onRequest(options, handler);
    }
    options.headers["Authorization"] = "Bearer $accessToken";
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) async {
    

    super.onError(err, handler);
    print(err.response?.statusCode);
    print(err.requestOptions.path);
    if ((err.response?.statusCode == 401 || err.response?.statusCode == 403 ) && !err.requestOptions.path.contains(LoginService.url)) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
     Navigator.of(App.context!).pushReplacement(MaterialPageRoute(
                            builder: (context) =>  LoginPage()));
    }
  }
}