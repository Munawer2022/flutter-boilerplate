import '../../../domain/entities/profile/mock_profile_success_model.dart';

class ProfileSuccessModel {
  ProfileSuccessModel();

  ProfileSuccessModel copyWith() {
    return ProfileSuccessModel();
  }

  factory ProfileSuccessModel.fromJson(Map<String, dynamic> json) {
    return ProfileSuccessModel();
  }
  MockProfileSuccessModel toDomain() =>
      MockProfileSuccessModel();
}
