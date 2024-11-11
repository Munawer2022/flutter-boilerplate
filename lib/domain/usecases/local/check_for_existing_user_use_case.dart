import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../data/datasources/auth/login/login_data_sources.dart';
import '/domain/repositories/local/local_storage_base_api_service.dart';
import '/domain/failures/local/existing_user_failure.dart';

class CheckForExistingUserUseCase {
  final LoginDataSources _loginDataSources;
  final SplashDataSources dataSources;
  final LocalStorageRepository _localStorageRepository;
  CheckForExistingUserUseCase(
      this._loginDataSources, this._localStorageRepository, this.dataSources);

  Future<Either<ExistingUserFailure, LocalUserInfoStoreModel>> execute() {
    return _localStorageRepository.getUserData().then((value) => value
            .fold((l) => left(ExistingUserFailure(error: l.error)),
                (mockLocalUserInfoStoreModel) {
          if (mockLocalUserInfoStoreModel.data.token.isNotEmpty) {
            _loginDataSources.setLoginDataSources(
                loginSuccessModel: mockLocalUserInfoStoreModel);
            return right(mockLocalUserInfoStoreModel);
          }
          return left(ExistingUserFailure(error: 'User doesn\'t exist '));
        }));
  }

  Future<Either<ExistingUserFailure, String>> executeCheckSelectedLanguage() {
    return _localStorageRepository.getSelectedLanguage().then((value) =>
        value.fold((l) => left(ExistingUserFailure(error: l.error)), (lang) {
          if (lang.isNotEmpty) {
            print(lang);
            dataSources.currentLang = lang;
            return right(lang);
          }
          return left(ExistingUserFailure(error: 'Not found language'));
        }));
  }
}
