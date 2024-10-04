import 'package:fpdart/fpdart.dart';
import '/domain/entities/home/mock_home_model.dart';
import '/domain/failures/home/home_failure.dart';

abstract class HomeBaseApiService {
  Future<Either<HomeFailure, MockHomeModel>> home();
}
