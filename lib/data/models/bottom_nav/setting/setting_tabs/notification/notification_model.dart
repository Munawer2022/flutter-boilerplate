import '/domain/entities/notification/mock_notification_model.dart';

class NotificationModel {
  NotificationModel();
  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel();
  //fromJson is null pass ?? ""
  MockNotificationModel toDomain() => const MockNotificationModel();
}