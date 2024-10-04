import 'package:fpdart/fpdart.dart';
import '/domain/entities/onboarding/mock_onboarding_model.dart';
import '/domain/failures/onboarding/onboarding_failure.dart';
import '/domain/repositories/onboarding/onboarding_base_api_service.dart';

class MockOnboardingRepository implements OnboardingBaseApiService {
  @override
  Future<Either<OnboardingFailure, MockOnboardingModel>> onboarding() =>
      throw UnimplementedError();    
}