import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/profile/profile_success_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/profile/profile_failure.dart';

abstract class ProfileBaseApiService {
  Future<Either<ProfileFailure, ProfileSuccessModel>> profile(
      {required Map<String, dynamic> body});
}
