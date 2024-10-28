import 'package:flutter_template/data/models/auth/splash/language_translations_model.dart';
import 'package:flutter_template/data/models/auth/splash/pages_model.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';

import 'package:flutter_template/domain/failures/auth/splash/splash_failure.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';

class SplashRepository implements SplashBaseApiService {
  final NetworkBaseApiService _networkRepository;

  SplashRepository(this._networkRepository);

  @override
  Future<Either<SplashFailure, Map<String, dynamic>>> splash() =>
      _networkRepository.get<Map<String, dynamic>>(url: AppUrl.splash).then(
          (value) => value.fold(
              (l) => left(SplashFailure(error: l.error)), (r) => right(r)));

  @override
  Future<Either<SplashFailure, PagesModel>> pages() => _networkRepository
      .get<Map<String, dynamic>>(url: AppUrl.pages)
      .then((value) => value.fold((l) => left(SplashFailure(error: l.error)),
          (r) => right(PagesModel.fromJson(r))));

  @override
  Future<Either<SplashFailure, LanguageTranslationsModel>> languageTranslations(
          {Map<String, String>? queryParams}) =>
      _networkRepository
          .get<Map<String, dynamic>>(
              url: AppUrl.languageTranslations, queryParams: queryParams)
          .then((value) => value.fold(
              (l) => left(SplashFailure(error: l.error)),
              (r) => right(LanguageTranslationsModel.fromJson(r))));
}
