import 'package:fpdart/fpdart.dart';
import '../../../../../models/bottom_nav/setting/setting_tabs/profile/profile_success_model.dart';
import '../../../../../../config/app_url.dart';

import '/domain/repositories/network/network_base_api_service.dart';
import '../../../../../../domain/failures/bottom_nav/setting/setting_tabs/profile/profile_failure.dart';
import '../../../../../../domain/repositories/bottom_nav/setting/setting_tabs/profile/profile_base_api_service.dart';

class ProfileRepository implements ProfileBaseApiService {
  final NetworkBaseApiService _networkRepository;

  ProfileRepository(this._networkRepository);

  @override
  Future<Either<ProfileFailure, ProfileSuccessModel>> profile(
          {required Map<String, dynamic> body}) =>
      _networkRepository
          .post<Map<String, dynamic>>(url: AppUrl.profile, body: body)
          .then((value) => value.fold(
              (l) => left(ProfileFailure(error: l.error)),
              (r) => right(ProfileSuccessModel.fromJson(r))));
}
