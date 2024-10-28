import 'package:flutter_template/data/models/auth/splash/language_translations_model.dart';
import 'package:flutter_template/data/models/auth/splash/pages_model.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../failures/auth/splash/splash_failure.dart';

abstract class SplashBaseApiService {
  Future<Either<SplashFailure, Map<String, dynamic>>> splash();
  Future<Either<SplashFailure, PagesModel>> pages();
  Future<Either<SplashFailure, LanguageTranslationsModel>> languageTranslations(
      {Map<String, String>? queryParams});
}
