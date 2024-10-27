import 'package:flutter_template/config/response/api_response.dart';
import 'package:flutter_template/domain/entities/splash/mock_splash_model.dart';

import 'splash_initial_params.dart';

class SplashState {
  final ApiResponse<MockSplashModel> response;
  final bool isloading;
  final bool isloadingLanguageChange;

  SplashState({
    required this.isloading,
    required this.response,
    required this.isloadingLanguageChange,
  });
  factory SplashState.initial({required SplashInitialParams initialParams}) =>
      SplashState(
        isloading: false,
        response: ApiResponse.initial(const MockSplashModel.empty().copyWith()),
        isloadingLanguageChange: false,
      );
  SplashState copyWith({
    bool? isloading,
    ApiResponse<MockSplashModel>? response,
    String? currentLang,
    bool? isloadingLanguageChange,
  }) =>
      SplashState(
          isloading: isloading ?? this.isloading,
          response: response ?? this.response,
          isloadingLanguageChange:
              isloadingLanguageChange ?? this.isloadingLanguageChange);
}
