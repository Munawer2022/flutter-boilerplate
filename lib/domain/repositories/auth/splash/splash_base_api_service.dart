import 'package:fpdart/fpdart.dart';
import '../../../failures/auth/splash/splash_failure.dart';

abstract class SplashBaseApiService {
  Future<Either<SplashFailure, Map<String, dynamic>>> systemSettings(
      {Map<String, String>? queryParams});
}
