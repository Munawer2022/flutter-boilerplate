
import '/domain/entities/setting/mock_setting_model.dart';
import 'setting_initial_params.dart';
import '/config/response/api_response.dart';

class SettingState {
  final ApiResponse<MockSettingModel> response;

  SettingState({required this.response});
  factory SettingState.initial({required SettingInitialParams initialParams}) =>
      SettingState(response: ApiResponse.initial(MockSettingModel.empty().copyWith()));
  SettingState copyWith(
          {ApiResponse<MockSettingModel>? response}) =>
      SettingState(
          response: response ?? this.response);
}



 