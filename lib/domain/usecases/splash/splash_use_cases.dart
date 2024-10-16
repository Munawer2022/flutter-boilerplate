import 'package:flutter_template/data/datasources/splash/language_translations_data_sources.dart';
import 'package:flutter_template/data/datasources/splash/splash_data_sources.dart';
import 'package:flutter_template/domain/entities/local/mock_local_selected_language_store_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:flutter_template/domain/repositories/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';

import '/domain/entities/splash/mock_splash_model.dart';
import '/domain/failures/splash/splash_failure.dart';

class SplashUseCases {
  final SplashBaseApiService baseApiService;
  final SplashDataSources dataSources;
  final LanguageTranslationsDataSources languageTranslationsDataSources;
  final LocalStorageRepository _localStorageRepository;

  SplashUseCases(this.baseApiService, this.dataSources,
      this._localStorageRepository, this.languageTranslationsDataSources);
  Future<Either<SplashFailure, MockSplashModel>> execute() async =>
      await baseApiService
          .splash()
          .then((value) => value.fold((l) => left(l), (r) {
                dataSources.setSplashDataSources(mockSplashModel: r);
                return right(r);
              }));

  Future<Either<SplashFailure, MockLanguageTranslationsModel>>
      executeLanguageTranslations() async => await baseApiService
          .languageTranslations(queryParams: {}).then((value) => value.fold(
              (l) => left(l),
              (r) => _localStorageRepository.setSelectedLanguage(lang: '').then(
                  (value) => value
                          .fold((l) => left(SplashFailure(error: l.error)),
                              (selectedLanguageRight) {
                        languageTranslationsDataSources
                            .setLanguageTranslationsDataSources(
                                mockLanguageTranslationsModel: r);
                        return right(r);
                      }))));
}
