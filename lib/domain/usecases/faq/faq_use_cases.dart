import 'package:fpdart/fpdart.dart';

import '/domain/entities/faq/mock_faq_model.dart';
import '/domain/failures/faq/faq_failure.dart';

class FaqUseCases {
  Future<Either<FaqFailure, MockFaqModel>> execute() => throw {};
}
