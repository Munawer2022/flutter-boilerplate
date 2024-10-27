import 'package:fpdart/fpdart.dart';
import '/domain/entities/setting/mock_setting_model.dart';
import '../../../../models/bottom_nav/setting/setting/setting_model.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '../../../../../domain/failures/bottom_nav/setting/setting/setting_failure.dart';
import '../../../../../domain/repositories/bottom_nav/setting/setting/setting_base_api_service.dart';

class SettingRepository implements SettingBaseApiService {
  final NetworkBaseApiService _networkRepository;

  SettingRepository(this._networkRepository);

  @override
  Future<Either<SettingFailure, MockSettingModel>> setting() =>
      _networkRepository.get<Map<String, dynamic>>(url: AppUrl.setting).then(
            (value) => value.fold((l) => left(SettingFailure(error: l.error)),
              (r) => right(SettingModel.fromJson(r).toDomain())));
}