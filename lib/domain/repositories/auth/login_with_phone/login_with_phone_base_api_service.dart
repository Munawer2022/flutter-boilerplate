import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../failures/auth/login_with_phone/login_with_phone_failure.dart';

abstract class LoginWithPhoneBaseApiService {
  Future<Either<LoginWithPhoneFailure, LocalUserInfoStoreModel>> loginWithPhone(
      {required Map<String, dynamic> body});
}
