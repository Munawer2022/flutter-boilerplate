import 'package:fpdart/fpdart.dart';

import '/domain/entities/setting/mock_setting_model.dart';
import '/domain/failures/setting/setting_failure.dart';

class SettingUseCases {
  Future<Either<SettingFailure, MockSettingModel>> execute() => throw {};
}
