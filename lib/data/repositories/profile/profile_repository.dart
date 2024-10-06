import 'package:fpdart/fpdart.dart';
import '/domain/entities/profile/mock_profile_success_model.dart';
import '/data/models/profile/profile_success_model.dart';
import '/core/app_url.dart';

import '/domain/repositories/network/network_base_api_service.dart';
import '/domain/failures/profile/profile_failure.dart';
import '/domain/repositories/profile/profile_base_api_service.dart';

class ProfileRepository implements ProfileBaseApiService {
  final NetworkBaseApiService _networkRepository;

  ProfileRepository(this._networkRepository);

  @override
  Future<Either<ProfileFailure, MockProfileSuccessModel>> profile(
     {required Map<String, dynamic> body}) =>
      _networkRepository.post<Map<String, dynamic>>(url:AppUrl.profile,body:body).then(
            (value) => value.fold((l) => left(ProfileFailure(error: l.error)),
              (r) => right(ProfileSuccessModel.fromJson(r).toDomain())));
}