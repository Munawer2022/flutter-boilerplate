import 'package:fpdart/fpdart.dart';
import '/domain/entities/faq/mock_faq_model.dart';
import '/domain/failures/faq/faq_failure.dart';
import '/domain/repositories/faq/faq_base_api_service.dart';
import '/core/global.dart';

class MockFaqRepository implements FaqBaseApiService {
  @override
  Future<Either<FaqFailure, MockFaqModel>> faq() async {
    await GlobalConstants.mockRepoTime;
    return right(MockFaqModel.empty().copyWith());
  }    
}