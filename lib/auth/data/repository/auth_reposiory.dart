import 'package:dio/dio.dart';
import 'package:jobseque/auth/data/auth_ednpoints.dart';

class AuthReposiory{
  static final Dio _dio = Dio();
  
 static Future<void>  createAccount(String name,String email, String password)async{
    final response = await _dio.post(AuthEdnpoints.createAccoint,
    data: {
      'name' : name,
      'email'  : email,
      'password' : password
    });

  }
}