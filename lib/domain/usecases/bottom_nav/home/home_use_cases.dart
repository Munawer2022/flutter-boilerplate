import 'package:fpdart/fpdart.dart';

import '/domain/entities/home/mock_home_model.dart';
import '../../../failures/bottom_nav/home/home_failure.dart';

class HomeUseCases {
  Future<Either<HomeFailure, MockHomeModel>> execute() => throw {};
}
