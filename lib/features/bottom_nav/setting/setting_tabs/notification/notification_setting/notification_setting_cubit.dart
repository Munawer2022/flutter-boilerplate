

  


import 'package:flutter_bloc/flutter_bloc.dart';
import 'notification_setting_initial_params.dart';
import 'notification_setting_navigator.dart';
import 'notification_setting_state.dart';

class NotificationSettingCubit extends Cubit<NotificationSettingState> {
  final NotificationSettingNavigator navigator;
  final NotificationSettingInitialParams initialParams;
NotificationSettingCubit(
  this.initialParams,
      this.navigator)
   : super(NotificationSettingState.initial(initialParams:initialParams));

}
