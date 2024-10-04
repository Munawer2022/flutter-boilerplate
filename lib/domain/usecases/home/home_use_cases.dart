import 'package:fpdart/fpdart.dart';

import '/domain/entities/home/mock_home_model.dart';
import '/domain/failures/home/home_failure.dart';

class HomeUseCases {
  Future<Either<HomeFailure, MockHomeModel>> execute() => throw {};
}
