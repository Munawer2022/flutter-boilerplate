import 'package:fpdart/fpdart.dart';
import '/domain/entities/faq/mock_faq_model.dart';
import '/data/models/faq/faq_model.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '/domain/failures/faq/faq_failure.dart';
import '/domain/repositories/faq/faq_base_api_service.dart';

class FaqRepository implements FaqBaseApiService {
  final NetworkBaseApiService _networkRepository;

  FaqRepository(this._networkRepository);

  @override
  Future<Either<FaqFailure, MockFaqModel>> faq() =>
      _networkRepository.get<Map<String, dynamic>>(url: AppUrl.faq).then(
            (value) => value.fold((l) => left(FaqFailure(error: l.error)),
              (r) => right(FaqModel.fromJson(r).toDomain())));
}