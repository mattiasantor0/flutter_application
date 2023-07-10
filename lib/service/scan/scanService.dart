
import 'package:flutter_application/Product.dart';
import 'package:flutter_application/loginResponse.dart';
import 'package:flutter_application/service/login/loginService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dio.dart';



class ScanService {


  Future<Product> scanCode(String code, context) async {
    Map<String, dynamic> request = {"code": code};
    print(request);
    String token;
   

    final response = await dio.post('/scan_code',
        data: request,
         );

    return Product.fromJson(response.data);
  }
}