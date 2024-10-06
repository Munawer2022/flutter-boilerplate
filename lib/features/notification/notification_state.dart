
import '/domain/entities/notification/mock_notification_model.dart';
import 'notification_initial_params.dart';
import '/config/response/api_response.dart';

class NotificationState {
  final ApiResponse<MockNotificationModel> response;

  NotificationState({required this.response});
  factory NotificationState.initial({required NotificationInitialParams initialParams}) =>
      NotificationState(response: ApiResponse.initial(MockNotificationModel.empty().copyWith()));
  NotificationState copyWith(
          {ApiResponse<MockNotificationModel>? response}) =>
      NotificationState(
          response: response ?? this.response);
}



 