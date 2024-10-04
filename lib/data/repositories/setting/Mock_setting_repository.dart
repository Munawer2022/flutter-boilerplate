import 'package:fpdart/fpdart.dart';
import '/domain/entities/setting/mock_setting_model.dart';
import '/domain/failures/setting/setting_failure.dart';
import '/domain/repositories/setting/setting_base_api_service.dart';
import '/core/global.dart';

class MockSettingRepository implements SettingBaseApiService {
  @override
  Future<Either<SettingFailure, MockSettingModel>> setting() async {
    await GlobalConstants.mockRepoTime;
    return right(MockSettingModel.empty().copyWith());
  }    
}