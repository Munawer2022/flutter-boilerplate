import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/notification/notification_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/notification/notification_failure.dart';

abstract class NotificationBaseApiService {
  Future<Either<NotificationFailure, NotificationModel>> notification();
}
