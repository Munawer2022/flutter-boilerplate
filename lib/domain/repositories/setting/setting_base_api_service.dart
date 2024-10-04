import 'package:fpdart/fpdart.dart';
import '/domain/entities/setting/mock_setting_model.dart';
import '/domain/failures/setting/setting_failure.dart';

abstract class SettingBaseApiService {
  Future<Either<SettingFailure, MockSettingModel>> setting();
}
