import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';
import 'package:flutter_template/domain/entities/splash/mock_pages_model.dart';
import 'package:fpdart/fpdart.dart';
import '/domain/entities/splash/mock_splash_model.dart';
import '/domain/failures/splash/splash_failure.dart';

abstract class SplashBaseApiService {
  Future<Either<SplashFailure, MockSplashModel>> splash();
  Future<Either<SplashFailure, MockPagesModel>> pages();
  Future<Either<SplashFailure, MockLanguageTranslationsModel>>
      languageTranslations({Map<String, String>? queryParams});
}
