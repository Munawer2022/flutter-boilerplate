import 'package:fpdart/fpdart.dart';
import '../../../../../models/bottom_nav/setting/setting_tabs/faq/faq_model.dart';
import '../../../../../../config/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '../../../../../../domain/failures/bottom_nav/setting/setting_tabs/faq/faq_failure.dart';
import '../../../../../../domain/repositories/bottom_nav/setting/setting_tabs/faq/faq_base_api_service.dart';

class FaqRepository implements FaqBaseApiService {
  final NetworkBaseApiService _networkRepository;

  FaqRepository(this._networkRepository);

  @override
  Future<Either<FaqFailure, FaqModel>> faq() => _networkRepository
      .get<Map<String, dynamic>>(url: AppUrl.faq)
      .then((value) => value.fold((l) => left(FaqFailure(error: l.error)),
          (r) => right(FaqModel.fromJson(r))));
}
