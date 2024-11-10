import 'setting_initial_params.dart';
import '../../../../config/response/api_response.dart';

class SettingState {
  final bool isDarkTheme;

  SettingState({required this.isDarkTheme});
  factory SettingState.initial({required SettingInitialParams initialParams}) =>
      SettingState(isDarkTheme: false);
  SettingState copyWith({response, bool? isDarkTheme}) => SettingState(
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );
}
