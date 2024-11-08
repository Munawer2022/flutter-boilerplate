import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../data/datasources/auth/login/login_data_sources.dart';
import '/domain/failures/auth/login/login_failure.dart';
import '/domain/repositories/auth/login/login_base_api_service.dart';
import '/domain/repositories/local/local_storage_base_api_service.dart';

class LoginUseCases {
  final LoginBaseApiService _baseApiService;
  final LoginDataSources _dataSources;
  final LocalStorageRepository _localStorageRepository;
  LoginUseCases(
      this._baseApiService, this._dataSources, this._localStorageRepository);
  Future<Either<LoginFailure, LocalUserInfoStoreModel>> execute(
          {required Map<String, dynamic> body}) async {
    try {
      final loginResult = await _baseApiService.login(body['email'], body['password']);
      return _localStorageRepository
          .setUserData(localUserInfoStoreModel: LocalUserInfoStoreModel.fromJson(loginResult))
          .then((value) => value.fold(
              (l) => Either.left(LoginFailure(error: l.error)),
              (r) {
                _dataSources.setLoginDataSources(loginSuccessModel: LocalUserInfoStoreModel.fromJson(loginResult));
                return Either.right(LocalUserInfoStoreModel.fromJson(loginResult));
              }));
    } catch (e) {
      return Either.left(LoginFailure(error: e.toString()));
    }
  }
}
