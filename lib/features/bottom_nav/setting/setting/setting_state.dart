import '/domain/entities/setting/mock_setting_model.dart';
import 'setting_initial_params.dart';
import '/config/response/api_response.dart';

class SettingState {
  final ApiResponse<MockSettingModel> response;
  final bool isDarkTheme;

  SettingState({required this.response, required this.isDarkTheme});
  factory SettingState.initial({required SettingInitialParams initialParams}) =>
      SettingState(
          response: ApiResponse.initial(MockSettingModel.empty().copyWith()),
          isDarkTheme: false);
  SettingState copyWith(
          {ApiResponse<MockSettingModel>? response, bool? isDarkTheme}) =>
      SettingState(
        response: response ?? this.response,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );
}
