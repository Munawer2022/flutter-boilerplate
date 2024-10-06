import 'package:fpdart/fpdart.dart';
import '/domain/entities/notification/mock_notification_model.dart';
import '/domain/failures/notification/notification_failure.dart';

abstract class NotificationBaseApiService {
  Future<Either<NotificationFailure, MockNotificationModel>> notification();
}
