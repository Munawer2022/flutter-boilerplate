import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/notification/notification_model.dart';

import 'notification_initial_params.dart';
import '../../../../../../config/response/api_response.dart';

class NotificationState {
  final ApiResponse<NotificationModel> response;

  NotificationState({required this.response});
  factory NotificationState.initial(
          {required NotificationInitialParams initialParams}) =>
      NotificationState(
          response: ApiResponse.initial(NotificationModel.empty()));
  NotificationState copyWith({ApiResponse<NotificationModel>? response}) =>
      NotificationState(response: response ?? this.response);
}
