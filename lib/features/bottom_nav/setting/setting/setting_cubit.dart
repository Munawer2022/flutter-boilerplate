import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/datasources/theme/theme_data_source.dart';
import 'package:flutter_template/domain/repositories/local/local_storage_base_api_service.dart';
import 'package:flutter_template/domain/usecases/theme/update_theme_use_case.dart';
import 'package:flutter_template/features/auth/login/login_initial_params.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/faq/faq_initial_params.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/notification/notification/notification_initial_params.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/widget/pages/pages_web_view_initial_params.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/profile/profile_initial_params.dart';
import 'setting_initial_params.dart';
import 'setting_navigator.dart';
import 'setting_state.dart';
import '../../../../config/response/api_response.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingNavigator navigator;
  final SettingInitialParams initialParams;
  final ThemeDataSources _themeDataSources;
  final UpdateThemeUseCase _updateThemeUseCase;
  final LocalStorageRepository _localStorageRepository;

  SettingCubit(this.initialParams, this.navigator, this._themeDataSources,
      this._updateThemeUseCase, this._localStorageRepository)
      : super(SettingState.initial(initialParams: initialParams));

  goProfilePage() => navigator.openProfile(const ProfileInitialParams());

  goNotificationPage() =>
      navigator.openNotification(const NotificationInitialParams());

  goFaqPage() => navigator.openFaq(const FaqInitialParams());

  onInitLoginDataSources() {
    emit(state.copyWith(isDarkTheme: _themeDataSources.state));
    _themeDataSources.stream.listen((event) {
      emit(state.copyWith(isDarkTheme: event));
    });
  }

  void onThemeChanged(bool value) => _updateThemeUseCase.execute(value);

  goPagesWebViewPage({required String url, required String title}) => navigator
      .openPagesWebView(PagesWebViewInitialParams(url: url, title: title));


  logout() => _localStorageRepository.removeUserData().then(
        (value) => value.fold(
          (l) => null,
          (r) => navigator.openLogin(const LoginInitialParams()),
        ),
      );
}
