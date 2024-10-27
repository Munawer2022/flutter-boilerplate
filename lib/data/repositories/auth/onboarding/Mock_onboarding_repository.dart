import 'package:fpdart/fpdart.dart';
import '/domain/entities/onboarding/mock_onboarding_model.dart';
import '../../../../domain/failures/auth/onboarding/onboarding_failure.dart';
import '../../../../domain/repositories/auth/onboarding/onboarding_base_api_service.dart';

class MockOnboardingRepository implements OnboardingBaseApiService {
  @override
  Future<Either<OnboardingFailure, MockOnboardingModel>> onboarding() =>
      throw UnimplementedError();    
}