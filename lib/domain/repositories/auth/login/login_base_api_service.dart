import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '/domain/failures/auth/login/login_failure.dart';

abstract class LoginBaseApiService {
  Future<Map<String, dynamic>> login(String email, String password);
}
