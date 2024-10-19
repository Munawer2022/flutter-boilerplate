import 'package:fpdart/fpdart.dart';
import '/domain/entities/faq/mock_faq_model.dart';
import '/domain/failures/faq/faq_failure.dart';

abstract class FaqBaseApiService {
  Future<Either<FaqFailure, MockFaqModel>> faq();
}
