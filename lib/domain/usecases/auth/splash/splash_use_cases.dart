import 'package:flutter_template/data/datasources/auth/splash/language_translations_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/pages_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/data/models/auth/splash/language_translations_model.dart';
import 'package:flutter_template/data/models/auth/splash/pages_model.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';

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
  Future<Either<SplashFailure, Map<String, dynamic>>> execute() async =>
      await baseApiService
          .splash()
          .then((value) => value.fold((l) => left(l), (r) {
                dataSources.setSplashDataSources(splashModel: r);
                return right(r);
              }));
  Future<Either<SplashFailure, PagesModel>> executePages() async =>
      await baseApiService
          .pages()
          .then((value) => value.fold((l) => left(l), (r) {
                pagesDataSources.setPagesDataSources(pagesModel: r);
                return right(r);
              }));

  Future<Either<SplashFailure, LanguageTranslationsModel>>
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
                                languageTranslationsModel: r);
                        return right(r);
                      }))));
}
