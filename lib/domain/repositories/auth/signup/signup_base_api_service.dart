import 'package:fpdart/fpdart.dart';
import '/data/models/local/local_user_info_store_model.dart';
import '/domain/failures/auth/signup/signup_failure.dart';

abstract class SignupBaseApiService {
  Future<Either<SignupFailure, LocalUserInfoStoreModel>> signup({
    required Map<String, dynamic> body,
  });
} 