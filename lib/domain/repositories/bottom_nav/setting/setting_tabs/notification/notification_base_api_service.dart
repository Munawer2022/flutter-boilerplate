import 'package:fpdart/fpdart.dart';
import '/domain/entities/notification/mock_notification_model.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/notification/notification_failure.dart';

abstract class NotificationBaseApiService {
  Future<Either<NotificationFailure, MockNotificationModel>> notification();
}
