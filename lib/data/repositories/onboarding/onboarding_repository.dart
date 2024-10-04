import 'package:fpdart/fpdart.dart';
import '/domain/entities/onboarding/mock_onboarding_model.dart';
import '/data/models/onboarding/onboarding_model.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '/domain/failures/onboarding/onboarding_failure.dart';
import '/domain/repositories/onboarding/onboarding_base_api_service.dart';

class OnboardingRepository implements OnboardingBaseApiService {
  final NetworkBaseApiService _networkRepository;

  OnboardingRepository(this._networkRepository);

  @override
  Future<Either<OnboardingFailure, MockOnboardingModel>> onboarding() =>
      throw UnimplementedError();
}