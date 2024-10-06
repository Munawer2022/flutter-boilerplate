

  


import 'package:flutter_bloc/flutter_bloc.dart';
import 'notifications_setting_initial_params.dart';
import 'notifications_setting_navigator.dart';
import 'notifications_setting_state.dart';

class NotificationsSettingCubit extends Cubit<NotificationsSettingState> {
  final NotificationsSettingNavigator navigator;
  final NotificationsSettingInitialParams initialParams;
NotificationsSettingCubit(
  this.initialParams,
      this.navigator)
   : super(NotificationsSettingState.initial(initialParams:initialParams));

}
