import 'package:flutter_template/config/response/api_response.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';

import 'splash_initial_params.dart';

class SplashState {
  final ApiResponse<Map<String, dynamic>> response;
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
        response: ApiResponse.initial({}),
        isloadingLanguageChange: false,
      );
  SplashState copyWith({
    bool? isloading,
    ApiResponse<Map<String, dynamic>>? response,
    String? currentLang,
    bool? isloadingLanguageChange,
  }) =>
      SplashState(
          isloading: isloading ?? this.isloading,
          response: response ?? this.response,
          isloadingLanguageChange:
              isloadingLanguageChange ?? this.isloadingLanguageChange);
}
