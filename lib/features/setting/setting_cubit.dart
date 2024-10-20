import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/datasources/theme/theme_data_source.dart';
import 'package:flutter_template/domain/usecases/theme/update_theme_use_case.dart';
import 'package:flutter_template/features/faq/faq_initial_params.dart';
import 'package:flutter_template/features/notification/notification_initial_params.dart';
import 'package:flutter_template/features/profile/profile_initial_params.dart';
import 'setting_initial_params.dart';
import 'setting_navigator.dart';
import 'setting_state.dart';
import '/domain/repositories/setting/setting_base_api_service.dart';
import '/config/response/api_response.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingBaseApiService baseApiServices;
  final SettingNavigator navigator;
  final SettingInitialParams initialParams;
  final ThemeDataSources _themeDataSources;
  final UpdateThemeUseCase _updateThemeUseCase;

  SettingCubit(this.initialParams, this.baseApiServices, this.navigator, this._themeDataSources, this._updateThemeUseCase)
      : super(SettingState.initial(initialParams: initialParams));

  Future<void> setting() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    final setting = await baseApiServices.setting();
    setting.fold(
        (l) => emit(state.copyWith(response: ApiResponse.error(l.error))),
        ((r) => emit(state.copyWith(response: ApiResponse.completed(r)))));
  }

  Future<void> refresh() async => setting();

  goProfilePage() => navigator.openProfile(const ProfileInitialParams());

  goNotificationPage() =>
      navigator.openNotification(const NotificationInitialParams());

  goFaqPage() => navigator.openFaq(const FaqInitialParams());

  onInitLoginDataSources() {
    emit(state.copyWith(
        isDarkTheme: _themeDataSources.state));
    _themeDataSources.stream.listen((event) {
      emit(state.copyWith(isDarkTheme: event));
    });
  }

  void onThemeChanged(bool value) => _updateThemeUseCase.execute(value);
}
