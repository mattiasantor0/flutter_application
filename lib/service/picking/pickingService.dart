import 'dart:convert';

import 'package:flutter_application/Product.dart';
import 'package:flutter_application/loginResponse.dart';
import 'package:flutter_application/pickingList.dart';
import 'package:flutter_application/service/login/loginService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dio.dart';



class PickingService {



  Future<PickingList> getPickingList() async {

    String token;
   

    final response = await dio.get('/get_picking_list',);

         print(response);

  
   // var jsonList = response.data[' '] as List;


  
  
    return PickingList.fromJson(response.data[0]);
  }
}