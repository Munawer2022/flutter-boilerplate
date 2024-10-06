import 'package:fpdart/fpdart.dart';
import '/domain/entities/notification/mock_notification_model.dart';
import '/data/models/notification/notification_model.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '/domain/failures/notification/notification_failure.dart';
import '/domain/repositories/notification/notification_base_api_service.dart';

class NotificationRepository implements NotificationBaseApiService {
  final NetworkBaseApiService _networkRepository;

  NotificationRepository(this._networkRepository);

  @override
  Future<Either<NotificationFailure, MockNotificationModel>> notification() =>
      _networkRepository.get<Map<String, dynamic>>(url: AppUrl.notification).then(
            (value) => value.fold((l) => left(NotificationFailure(error: l.error)),
              (r) => right(NotificationModel.fromJson(r).toDomain())));
}