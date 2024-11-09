import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/domain/failures/sign/sign_up_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class SignUpBaseApiService {
  Future<Either<SignUpFailure, LocalUserInfoStoreModel>> sign_up(
      {required Map<String, dynamic> body});
}
