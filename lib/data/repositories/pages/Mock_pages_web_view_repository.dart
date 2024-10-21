import 'package:fpdart/fpdart.dart';
import '/domain/entities/pages/mock_pages_web_view_model.dart';
import '/domain/failures/pages/pages_web_view_failure.dart';
import '/domain/repositories/pages/pages_web_view_base_api_service.dart';

class MockPagesWebViewRepository implements PagesWebViewBaseApiService {
  @override
  Future<Either<PagesWebViewFailure, MockPagesWebViewModel>> pages_web_view() =>
      throw UnimplementedError();
}
