import 'package:fpdart/fpdart.dart';
import '../../../failures/auth/login_with_phone/login_with_phone_failure.dart';

abstract class LoginWithPhoneBaseApiService {
  Future<Either<LoginWithPhoneFailure, Map<String, dynamic>>> loginWithPhone(
      {required Map<String, dynamic> body});
}
