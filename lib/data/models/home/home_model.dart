import '/domain/entities/home/mock_home_model.dart';

class HomeModel {
  HomeModel();
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel();
  //fromJson is null pass ?? ""
  MockHomeModel toDomain() => const MockHomeModel();
}
