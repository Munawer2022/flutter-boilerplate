import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '/domain/failures/login_with_otp/login_with_otp_failure.dart';

abstract class LoginWithOtpBaseApiService {
  Future<Either<LoginWithOtpFailure, Map<String,dynamic>>> loginWithOtp(
      {required Map<String, dynamic> body});
}
