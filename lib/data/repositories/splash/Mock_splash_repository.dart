import 'package:fpdart/fpdart.dart';
import '/domain/entities/splash/mock_splash_model.dart';
import '/domain/failures/splash/splash_failure.dart';
import '/domain/repositories/splash/splash_base_api_service.dart';
import '/core/global.dart';

class MockSplashRepository implements SplashBaseApiService {
  @override
  Future<Either<SplashFailure, MockSplashModel>> splash() async {
    await GlobalConstants.mockRepoTime;
    return right(MockSplashModel.empty().copyWith());
  }
}
