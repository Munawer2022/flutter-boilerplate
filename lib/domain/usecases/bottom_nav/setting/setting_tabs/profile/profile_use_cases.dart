import 'package:fpdart/fpdart.dart';

import '/domain/entities/profile/mock_profile_model.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/profile/profile_failure.dart';

class ProfileUseCases {
  Future<Either<ProfileFailure, MockProfileModel>> execute() => throw {};
}
