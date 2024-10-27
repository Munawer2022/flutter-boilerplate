import 'package:fpdart/fpdart.dart';
import '/domain/entities/faq/mock_faq_model.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/faq/faq_failure.dart';

abstract class FaqBaseApiService {
  Future<Either<FaqFailure, MockFaqModel>> faq();
}
