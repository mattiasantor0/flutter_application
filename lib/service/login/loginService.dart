
import 'package:flutter_application/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../loginResponse.dart';


class LoginService {
   static const url = '/login';

  Future<LoginResponse> login(String username, password, context) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> request = {"username": username, "password": password};
    print(request);
    

    final response = await dio.post(url,
        data: request ,);

    print(response.data);
    String token=LoginResponse.fromJson(response.data).accessToken;
    print(token);
  
    

    return LoginResponse.fromJson(response.data);
  }
}
