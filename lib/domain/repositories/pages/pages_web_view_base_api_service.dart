import 'package:fpdart/fpdart.dart';
import '/domain/entities/pages/mock_pages_web_view_model.dart';
import '/domain/failures/pages/pages_web_view_failure.dart';

abstract class PagesWebViewBaseApiService {
  Future<Either<PagesWebViewFailure, MockPagesWebViewModel>> pages_web_view();
}
