import 'package:fpdart/fpdart.dart';
import '/data/models/local/local_user_info_store_model.dart';
import '/domain/failures/auth/signup/signup_failure.dart';
import '/domain/repositories/auth/signup/signup_base_api_service.dart';
import '/domain/repositories/local/local_storage_base_api_service.dart';
import '/data/datasources/auth/signup/signup_data_sources.dart';

class SignupUseCases {
  final SignupBaseApiService _baseApiService;
  final SignupDataSources _dataSources;
  final LocalStorageRepository _localStorageRepository;

  SignupUseCases(
      this._baseApiService, this._dataSources, this._localStorageRepository);

  Future<Either<SignupFailure, LocalUserInfoStoreModel>> execute(
          {required Map<String, dynamic> body}) async =>
      await _baseApiService.signup(body: body).then((value) => value.fold(
          (l) => left(l),
          (r) => _localStorageRepository
              .setUserData(localUserInfoStoreModel: r)
              .then((value) => value.fold(
                      (l) => left(SignupFailure(error: l.error)), (tokenRight) {
                    _dataSources.setSignupDataSources(signupSuccessModel: r);
                    return right(r);
                  }))));
} 