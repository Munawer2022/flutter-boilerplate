import 'package:fpdart/fpdart.dart';
import '/domain/entities/onboarding/mock_onboarding_model.dart';
import '/domain/failures/onboarding/onboarding_failure.dart';

abstract class OnboardingBaseApiService {
  Future<Either<OnboardingFailure, MockOnboardingModel>> onboarding();
}
