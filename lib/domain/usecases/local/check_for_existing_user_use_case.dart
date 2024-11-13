import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
import 'package:flutter_template/data/datasources/app/logo_data_sources.dart';
import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../data/datasources/user/user_data_sources.dart';
import '/domain/repositories/local/local_storage_base_api_service.dart';
import '/domain/failures/local/existing_user_failure.dart';

class CheckForExistingUserUseCase {
  final UserDataSources _loginDataSources;
  final AppDataSources dataSources;
  final LogoDataSources logoDataSources;
  final LocalStorageRepository _localStorageRepository;
  CheckForExistingUserUseCase(this._loginDataSources,
      this._localStorageRepository, this.dataSources, this.logoDataSources);

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

  Future<Either<ExistingUserFailure, String>> executeLogoBase64() {
    return _localStorageRepository.getLogoBase64().then((value) =>
        value.fold((l) => left(ExistingUserFailure(error: l.error)), (logo) {
          if (logo.isNotEmpty) {
            logoDataSources.setLogoBase64DataSources(logoBase64: logo);
            return right(logo);
          }
          return left(ExistingUserFailure(error: 'Logo doesn\'t exist '));
        }));
  }
}
