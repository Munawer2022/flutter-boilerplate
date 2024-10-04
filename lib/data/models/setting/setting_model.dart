import '/domain/entities/setting/mock_setting_model.dart';

class SettingModel {
  SettingModel();
  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel();
  //fromJson is null pass ?? ""
  MockSettingModel toDomain() => const MockSettingModel();
}