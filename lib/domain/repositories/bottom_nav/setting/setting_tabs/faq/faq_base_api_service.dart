import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/faq/faq_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../failures/bottom_nav/setting/setting_tabs/faq/faq_failure.dart';

abstract class FaqBaseApiService {
  Future<Either<FaqFailure, FaqModel>> faq();
}
