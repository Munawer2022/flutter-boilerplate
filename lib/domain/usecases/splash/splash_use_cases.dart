import 'package:flutter_template/data/datasources/splash/splash_data_sources.dart';
import 'package:flutter_template/domain/repositories/splash/splash_base_api_service.dart';
import 'package:fpdart/fpdart.dart';

import '/domain/entities/splash/mock_splash_model.dart';
import '/domain/failures/splash/splash_failure.dart';

class SplashUseCases {
  final SplashBaseApiService baseApiService;
  final SplashDataSources dataSources;
  SplashUseCases(this.baseApiService, this.dataSources);
  Future<Either<SplashFailure, MockSplashModel>> execute() async =>
      await baseApiService
          .splash()
          .then((value) => value.fold((l) => left(l), (r) {
                dataSources.setSplashDataSources(mockSplashModel: r);
                return right(r);
              }));
}
