import 'package:dio/dio.dart';
import 'package:flutter_template/domain/repositories/auth/login/login_base_api_service.dart';
import 'package:flutter_template/data/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final Dio dio;

  LoginRepositoryImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/api/login', // adjust this endpoint according to your API
        data: {
          'email': email,
          'password': password,
        },
      );
      
      return response.data as Map<String, dynamic>;
    } catch (e) {
      if (e is DioException) {
        throw e.response?.data['message'] ?? 'Login failed';
      }
      throw 'An unexpected error occurred';
    }
  }
} 