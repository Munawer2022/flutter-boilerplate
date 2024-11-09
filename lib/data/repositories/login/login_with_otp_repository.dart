import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/domain/failures/login_with_otp/login_with_otp_failure.dart';
import 'package:flutter_template/domain/repositories/login/login_with_otp_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '/core/app_url.dart';

import '/domain/repositories/network/network_base_api_service.dart';

class LoginWithOtpRepository implements LoginWithOtpBaseApiService {
  final NetworkBaseApiService _networkRepository;

  LoginWithOtpRepository(this._networkRepository);

  @override
  Future<Either<LoginWithOtpFailure, Map<String, dynamic>>> loginWithOtp(
          {required Map<String, dynamic> body}) =>
      _networkRepository
          .post<Map<String, dynamic>>(url: AppUrl.loginWithOtp, body: body)
          .then((value) => value.fold(
              (l) => left(LoginWithOtpFailure(error: l.error)),
              (r) => right(r)));
}
