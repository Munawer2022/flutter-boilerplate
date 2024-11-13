import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';

import '../../../failures/auth/splash/splash_failure.dart';

class SplashUseCases {
  final SplashBaseApiService baseApiService;
  final AppDataSources dataSources;
  final LocalStorageRepository _localStorageRepository;

  SplashUseCases(
      this.baseApiService, this.dataSources, this._localStorageRepository);

  Future<Either<SplashFailure, Map<String, dynamic>>> execute(
          {required String lang}) async =>
      await baseApiService.systemSettings(queryParams: {"lang": lang}).then(
          (value) => value.fold((l) => left(l), (r) async {
                await _localStorageRepository.setLogoBase64(
                    logoBase64: r['data']['app_logo_base64']);
                return _localStorageRepository
                    .setSelectedLanguage(lang: lang)
                    .then((value) => value
                            .fold((l) => left(SplashFailure(error: l.error)),
                                (systemSettings) {
                          dataSources.currentLang = lang;
                          dataSources.setSplashDataSources(systemSettings: r);
                          return right(r);
                        }));
              }));
}
