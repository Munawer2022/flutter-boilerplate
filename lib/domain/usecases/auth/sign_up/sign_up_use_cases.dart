import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/domain/failures/auth/sign/sign_up_failure.dart';
import 'package:flutter_template/domain/repositories/auth/sign/sign_up_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../data/datasources/user/user_data_sources.dart';
import '/domain/failures/auth/login/login_failure.dart';
import '/domain/repositories/auth/login/login_base_api_service.dart';
import '/domain/repositories/local/local_storage_base_api_service.dart';

class SignUpUseCases {
  final SignUpBaseApiService _baseApiService;
  final UserDataSources _dataSources;
  final LocalStorageRepository _localStorageRepository;
  SignUpUseCases(
      this._baseApiService, this._dataSources, this._localStorageRepository);
  Future<Either<SignUpFailure, LocalUserInfoStoreModel>> execute(
          {required Map<String, dynamic> body}) async =>
      await _baseApiService.sign_up(body: body).then((value) => value.fold(
          (l) => left(l),
          (r) => _localStorageRepository
              .setUserData(localUserInfoStoreModel: r)
              .then((value) => value.fold(
                      (l) => left(SignUpFailure(error: l.error)), (tokenRight) {
                    _dataSources.setLoginDataSources(loginSuccessModel: r);
                    return right(r);
                  }))));
}
