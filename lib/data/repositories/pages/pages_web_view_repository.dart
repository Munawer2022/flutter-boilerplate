import 'package:fpdart/fpdart.dart';
import '/domain/entities/pages/mock_pages_web_view_model.dart';
import '/data/models/pages/pages_web_view_model.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '/domain/failures/pages/pages_web_view_failure.dart';
import '/domain/repositories/pages/pages_web_view_base_api_service.dart';

class PagesWebViewRepository implements PagesWebViewBaseApiService {
  final NetworkBaseApiService _networkRepository;

  PagesWebViewRepository(this._networkRepository);

  @override
  Future<Either<PagesWebViewFailure, MockPagesWebViewModel>> pages_web_view() =>
      throw UnimplementedError();
}
