import 'package:flutter_template/data/models/auth/splash/language_translations_model.dart';
import 'package:flutter_template/data/models/auth/splash/pages_model.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_pages_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_splash_model.dart';
import 'package:flutter_template/domain/failures/auth/splash/splash_failure.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';

class SplashRepository implements SplashBaseApiService {
  final NetworkBaseApiService _networkRepository;

  SplashRepository(this._networkRepository);

  @override
  Future<Either<SplashFailure, MockSplashModel>> splash() => _networkRepository
      .get<Map<String, dynamic>>(url: AppUrl.splash)
      .then((value) => value.fold((l) => left(SplashFailure(error: l.error)),
          (r) => right(SplashModel.fromJson(r).toDomain())));

  @override
  Future<Either<SplashFailure, MockPagesModel>> pages() => _networkRepository
      .get<Map<String, dynamic>>(url: AppUrl.pages)
      .then((value) => value.fold((l) => left(SplashFailure(error: l.error)),
          (r) => right(PagesModel.fromJson(r).toDomain())));

  @override
  Future<Either<SplashFailure, MockLanguageTranslationsModel>>
      languageTranslations(
              {Map<String, String>? queryParams}) =>
          _networkRepository
              .get<Map<String, dynamic>>(
                  url: AppUrl.languageTranslations, queryParams: queryParams)
              .then((value) => value.fold(
                  (l) => left(SplashFailure(error: l.error)),
                  (r) =>
                      right(LanguageTranslationsModel.fromJson(r).toDomain())));
}
