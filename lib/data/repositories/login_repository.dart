import 'package:dio/dio.dart';
import 'package:flutter_template/domain/repositories/auth/login/login_base_api_service.dart';

class LoginRepository implements LoginBaseApiService {
  final Dio dio;

  LoginRepository({required this.dio});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://pro.ramzdev.space/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      throw 'Login failed';
    } catch (e) {
      throw 'Login failed: ${e.toString()}';
    }
  }
} 