import 'package:fpdart/fpdart.dart';
import '/domain/entities/home/mock_home_model.dart';
import '/domain/failures/home/home_failure.dart';
import '/domain/repositories/home/home_base_api_service.dart';
import '/core/global.dart';

class MockHomeRepository implements HomeBaseApiService {
  @override
  Future<Either<HomeFailure, MockHomeModel>> home() async {
    await GlobalConstants.mockRepoTime;
    return right(MockHomeModel.empty().copyWith());
  }
}
