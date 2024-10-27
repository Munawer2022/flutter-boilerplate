import '/domain/entities/pages/mock_pages_web_view_model.dart';

class PagesWebViewModel {
  PagesWebViewModel();
  factory PagesWebViewModel.fromJson(Map<String, dynamic> json) =>
      PagesWebViewModel();
  //fromJson is null pass ?? ""
  MockPagesWebViewModel toDomain() => const MockPagesWebViewModel();
}
