import 'package:fpdart/fpdart.dart';
import '/domain/entities/notification/mock_notification_model.dart';
import '../../../../../../domain/failures/bottom_nav/setting/setting_tabs/notification/notification_failure.dart';
import '../../../../../../domain/repositories/bottom_nav/setting/setting_tabs/notification/notification_base_api_service.dart';
import '/core/global.dart';

class MockNotificationRepository implements NotificationBaseApiService {
  @override
  Future<Either<NotificationFailure, MockNotificationModel>> notification() async {
    await GlobalConstants.mockRepoTime;
    return right(MockNotificationModel.empty().copyWith());
  }    
}