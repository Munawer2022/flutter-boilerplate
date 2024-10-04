import '/domain/entities/onboarding/mock_onboarding_model.dart';

class OnboardingModel {
  OnboardingModel();
  factory OnboardingModel.fromJson(Map<String, dynamic> json) => OnboardingModel();
  //fromJson is null pass ?? ""
  MockOnboardingModel toDomain() => const MockOnboardingModel();
}