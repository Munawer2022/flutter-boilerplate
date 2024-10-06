import 'package:fpdart/fpdart.dart';

import '/domain/entities/notification/mock_notification_model.dart';
import '/domain/failures/notification/notification_failure.dart';

class NotificationUseCases {
  Future<Either<NotificationFailure, MockNotificationModel>> execute() => throw {};
}
