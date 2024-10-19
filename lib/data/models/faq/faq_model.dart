import '/domain/entities/faq/mock_faq_model.dart';

class FaqModel {
  FaqModel();
  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel();
  //fromJson is null pass ?? ""
  MockFaqModel toDomain() => const MockFaqModel();
}