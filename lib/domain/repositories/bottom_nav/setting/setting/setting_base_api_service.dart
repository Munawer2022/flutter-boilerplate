import 'package:fpdart/fpdart.dart';
import '/domain/entities/setting/mock_setting_model.dart';
import '../../../../failures/bottom_nav/setting/setting/setting_failure.dart';

abstract class SettingBaseApiService {
  Future<Either<SettingFailure, MockSettingModel>> setting();
}
