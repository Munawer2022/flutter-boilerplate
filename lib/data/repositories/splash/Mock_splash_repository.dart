import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';
import 'package:fpdart/fpdart.dart';
import '/domain/entities/splash/mock_splash_model.dart';
import '/domain/failures/splash/splash_failure.dart';
import '/domain/repositories/splash/splash_base_api_service.dart';
import '/core/global.dart';

class MockSplashRepository implements SplashBaseApiService {
  @override
  Future<Either<SplashFailure, MockSplashModel>> splash() async {
    await GlobalConstants.mockRepoTime;
    return right(const MockSplashModel.empty().copyWith());
  }

  @override
  Future<Either<SplashFailure, MockLanguageTranslationsModel>>
      languageTranslations({Map<String, String>? queryParams}) async {
    await GlobalConstants.mockRepoTime;
    return right(MockLanguageTranslationsModel.empty().copyWith());
  }
}
