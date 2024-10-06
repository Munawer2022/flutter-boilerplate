import 'package:fpdart/fpdart.dart';

import '/domain/entities/profile/mock_profile_model.dart';
import '/domain/failures/profile/profile_failure.dart';

class ProfileUseCases {
  Future<Either<ProfileFailure, MockProfileModel>> execute() => throw {};
}
