import 'package:fpdart/fpdart.dart';
import '/domain/entities/profile/mock_profile_success_model.dart';
import '/domain/failures/profile/profile_failure.dart';


abstract class ProfileBaseApiService {
  Future<Either<ProfileFailure, MockProfileSuccessModel>> profile(
    {required Map<String, dynamic> body});
}
