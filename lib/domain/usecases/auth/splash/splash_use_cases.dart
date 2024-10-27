import 'package:flutter_template/data/datasources/auth/splash/language_translations_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/pages_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/domain/entities/local/mock_local_selected_language_store_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_pages_model.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '/domain/entities/splash/mock_splash_model.dart';
import '../../../failures/auth/splash/splash_failure.dart';

class SplashUseCases {
  final SplashBaseApiService baseApiService;
  final SplashDataSources dataSources;
  final LanguageTranslationsDataSources languageTranslationsDataSources;
  final PagesDataSources pagesDataSources;
  final LocalStorageRepository _localStorageRepository;

  SplashUseCases(
      this.baseApiService,
      this.dataSources,
      this._localStorageRepository,
      this.languageTranslationsDataSources,
      this.pagesDataSources);
  Future<Either<SplashFailure, MockSplashModel>> execute() async =>
      await baseApiService
          .splash()
          .then((value) => value.fold((l) => left(l), (r) {
                dataSources.setSplashDataSources(mockSplashModel: r);
                return right(r);
              }));
  Future<Either<SplashFailure, MockPagesModel>> executePages() async =>
      await baseApiService
          .pages()
          .then((value) => value.fold((l) => left(l), (r) {
                pagesDataSources.setPagesDataSources(mockPagesModel: r);
                return right(r);
              }));

  Future<Either<SplashFailure, MockLanguageTranslationsModel>>
      executeLanguageTranslations({required String lang}) async =>
          await baseApiService.languageTranslations(queryParams: {
            "lang": lang
          }).then((value) => value.fold(
              (l) => left(l),
              (r) => _localStorageRepository
                  .setSelectedLanguage(lang: lang)
                  .then((value) => value
                          .fold((l) => left(SplashFailure(error: l.error)),
                              (selectedLanguageRight) {
                        languageTranslationsDataSources.currentLang = lang;
                        languageTranslationsDataSources
                            .setLanguageTranslationsDataSources(
                                mockLanguageTranslationsModel: r);
                        return right(r);
                      }))));
}
