import 'package:fpdart/fpdart.dart';
import '/domain/entities/profile/mock_profile_success_model.dart';
import '../../../../../../domain/failures/bottom_nav/setting/setting_tabs/profile/profile_failure.dart';
import '../../../../../../domain/repositories/bottom_nav/setting/setting_tabs/profile/profile_base_api_service.dart';
import '/core/global.dart';

class MockProfileRepository implements ProfileBaseApiService {
  @override
  Future<Either<ProfileFailure, MockProfileSuccessModel>> profile(
     {required Map<String, dynamic> body}
  ) async {
    await GlobalConstants.mockRepoTime;
    return right(MockProfileSuccessModel.empty().copyWith());
  }
}