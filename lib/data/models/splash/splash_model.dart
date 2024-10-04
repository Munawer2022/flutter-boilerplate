import '/domain/entities/splash/mock_splash_model.dart';

class SplashModel {
  SplashModel();
  factory SplashModel.fromJson(Map<String, dynamic> json) => SplashModel();
  //fromJson is null pass ?? ""
  MockSplashModel toDomain() => const MockSplashModel();
}
