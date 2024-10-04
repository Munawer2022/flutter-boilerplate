import 'package:fpdart/fpdart.dart';

import '/domain/entities/splash/mock_splash_model.dart';
import '/domain/failures/splash/splash_failure.dart';

class SplashUseCases {
  Future<Either<SplashFailure, MockSplashModel>> execute() => throw {};
}
