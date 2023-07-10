
import 'dart:core';

import 'package:flutter_application/user.dart';

class LoginResponse {
  final String status;
  final String accessToken;
  final User user;

  const LoginResponse({
     required this.status,
     required this.accessToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      accessToken: json['access_token'],
      user: User.fromJson(json['user']),
     
    );
  }
}





