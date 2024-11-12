import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/domain/failures/auth/login_with_phone/login_with_phone_failure.dart';
import 'package:flutter_template/domain/repositories/auth/login_with_phone/login_with_phone_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../config/app_url.dart';

import '/domain/repositories/network/network_base_api_service.dart';

class LoginWithPhoneRepository implements LoginWithPhoneBaseApiService {
  final NetworkBaseApiService _networkRepository;

  LoginWithPhoneRepository(this._networkRepository);

  @override
  Future<Either<LoginWithPhoneFailure, LocalUserInfoStoreModel>> loginWithPhone(
          {required Map<String, dynamic> body}) =>
      _networkRepository
          .post<Map<String, dynamic>>(url: AppUrl.loginWithPhone, body: body)
          .then((value) => value.fold(
              (l) => left(LoginWithPhoneFailure(error: l.error)),
              (r) => right(LocalUserInfoStoreModel.fromJson(r))));
}
