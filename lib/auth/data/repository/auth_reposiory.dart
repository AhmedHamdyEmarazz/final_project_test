import 'package:dio/dio.dart';
import 'package:jobseque/auth/data/auth_ednpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthReposiory {
  static final Dio _dio = Dio();

  static Future<void> createAccount(
      String name, String email, String password) async {
    final response = await _dio.post(AuthEdnpoints.createAccoint,
        data: {'name': name, 'email': email, 'password': password});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', (response.data['token']));
    print(response.data['token']);
    print(((response.data['data'] as Map)['name']));
  }

  static Future<void> login(String email, String password) async {
    final response = await _dio.post(AuthEdnpoints.login,
        data: {'email': email, 'password': password});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', (response.data['token']));
    print(response.data['token']);
    print(((response.data['user'] as Map)['name']));
    print('https://github.com/AhmedHamdyEmarazz/flutter.git');
  }
}
