import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';

import '../../../failures/auth/splash/splash_failure.dart';

class SplashUseCases {
  final SplashBaseApiService baseApiService;
  final SplashDataSources dataSources;
  final LocalStorageRepository _localStorageRepository;

  SplashUseCases(
      this.baseApiService, this.dataSources, this._localStorageRepository);

  Future<Either<SplashFailure, Map<String, dynamic>>> execute(
          {required String lang}) async =>
      await baseApiService.systemSettings(queryParams: {"lang": lang}).then(
          (value) => value.fold(
              (l) => left(l),
              (r) => _localStorageRepository
                  .setSelectedLanguage(lang: lang)
                  .then((value) => value
                          .fold((l) => left(SplashFailure(error: l.error)),
                              (systemSettings) {
                        dataSources.currentLang = lang;
                        dataSources.setSplashDataSources(systemSettings: r);
                        return right(r);
                      }))));
}
