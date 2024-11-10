import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/domain/failures/auth/sign/sign_up_failure.dart';
import 'package:flutter_template/domain/repositories/auth/sign/sign_up_base_api_service.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../config/app_url.dart';

import '/domain/repositories/network/network_base_api_service.dart';

class SignUpRepository implements SignUpBaseApiService {
  final NetworkBaseApiService _networkRepository;

  SignUpRepository(this._networkRepository);

  @override
  Future<Either<SignUpFailure, LocalUserInfoStoreModel>> sign_up(
          {required Map<String, dynamic> body}) =>
      _networkRepository
          .post<Map<String, dynamic>>(url: AppUrl.signUp, body: body)
          .then((value) => value.fold(
              (l) => left(SignUpFailure(error: l.error)),
              (r) => right(LocalUserInfoStoreModel.fromJson(r))));
}
