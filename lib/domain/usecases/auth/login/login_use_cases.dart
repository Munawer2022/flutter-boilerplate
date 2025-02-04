import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../data/datasources/user/user_data_sources.dart';
import '/domain/failures/auth/login/login_failure.dart';
import '/domain/repositories/auth/login/login_base_api_service.dart';
import '/domain/repositories/local/local_storage_base_api_service.dart';

class LoginUseCases {
  final LoginBaseApiService _baseApiService;
  final UserDataSources _dataSources;
  final LocalStorageRepository _localStorageRepository;
  LoginUseCases(
      this._baseApiService, this._dataSources, this._localStorageRepository);
  Future<Either<LoginFailure, LocalUserInfoStoreModel>> execute(
          {required Map<String, dynamic> body}) async =>
      await _baseApiService.login(body: body).then((value) => value.fold(
          (l) => left(l),
          (r) => _localStorageRepository
              .setUserData(localUserInfoStoreModel: r)
              .then((value) => value.fold(
                      (l) => left(LoginFailure(error: l.error)), (tokenRight) {
                    _dataSources.setLoginDataSources(loginSuccessModel: r);
                    return right(r);
                  }))));
}
