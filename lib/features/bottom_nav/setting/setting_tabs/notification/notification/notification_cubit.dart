import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/notification/notification_setting/notification_setting_initial_params.dart';
import 'notification_initial_params.dart';
import 'notification_navigator.dart';
import 'notification_state.dart';
import '../../../../../../domain/repositories/bottom_nav/setting/setting_tabs/notification/notification_base_api_service.dart';
import '/config/response/api_response.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationBaseApiService baseApiServices;
  final NotificationNavigator navigator;
  final NotificationInitialParams initialParams;
  NotificationCubit(this.initialParams, this.baseApiServices, this.navigator)
      : super(NotificationState.initial(initialParams: initialParams));

  Future<void> notification() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    final notification = await baseApiServices.notification();
    notification.fold(
        (l) => emit(state.copyWith(response: ApiResponse.error(l.error))),
        ((r) => emit(state.copyWith(response: ApiResponse.completed(r)))));
  }

  Future<void> refresh() async => notification();

  goNoticationSettingPage() => navigator
      .openNotificationSetting(const NotificationSettingInitialParams());
}
