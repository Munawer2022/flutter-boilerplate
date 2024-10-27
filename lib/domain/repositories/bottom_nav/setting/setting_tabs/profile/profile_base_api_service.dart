import 'package:fpdart/fpdart.dart';
import '/domain/entities/profile/mock_profile_success_model.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/profile/profile_failure.dart';


abstract class ProfileBaseApiService {
  Future<Either<ProfileFailure, MockProfileSuccessModel>> profile(
    {required Map<String, dynamic> body});
}
