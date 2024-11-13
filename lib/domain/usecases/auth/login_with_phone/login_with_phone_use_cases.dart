import 'package:flutter_template/data/datasources/user/user_data_sources.dart';
import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/domain/repositories/auth/login_with_phone/login_with_phone_base_api_service.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:fpdart/fpdart.dart';

import '../../../failures/auth/login_with_phone/login_with_phone_failure.dart';

class LoginWithOtpUseCases {
  final LoginWithPhoneBaseApiService _baseApiService;
  final UserDataSources _dataSources;
  final LocalStorageRepository _localStorageRepository;
  LoginWithOtpUseCases(
      this._baseApiService, this._dataSources, this._localStorageRepository);
  Future<Either<LoginWithPhoneFailure, LocalUserInfoStoreModel>> execute(
          {required Map<String, dynamic> body}) async =>
      await _baseApiService.loginWithPhone(body: body).then((value) =>
          value.fold(
              (l) => left(l),
              (r) => _localStorageRepository
                  .setUserData(localUserInfoStoreModel: r)
                  .then((value) => value.fold(
                          (l) => left(LoginWithPhoneFailure(error: l.error)),
                          (tokenRight) {
                        _dataSources.setLoginDataSources(loginSuccessModel: r);
                        return right(r);
                      }))));
}
