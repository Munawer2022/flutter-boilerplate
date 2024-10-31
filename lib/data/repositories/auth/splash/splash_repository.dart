import 'package:flutter_template/domain/failures/auth/splash/splash_failure.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';

class SplashRepository implements SplashBaseApiService {
  final NetworkBaseApiService _networkRepository;

  SplashRepository(this._networkRepository);

  @override
  Future<Either<SplashFailure, Map<String, dynamic>>> systemSettings(
          {Map<String, String>? queryParams}) =>
      _networkRepository
          .get<Map<String, dynamic>>(
              url: AppUrl.systemSettings, queryParams: queryParams)
          .then((value) => value.fold(
              (l) => left(SplashFailure(error: l.error)), (r) => right(r)));
}
