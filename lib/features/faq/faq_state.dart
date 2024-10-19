
import '/domain/entities/faq/mock_faq_model.dart';
import 'faq_initial_params.dart';
import '/config/response/api_response.dart';

class FaqState {
  final ApiResponse<MockFaqModel> response;

  FaqState({required this.response});
  factory FaqState.initial({required FaqInitialParams initialParams}) =>
      FaqState(response: ApiResponse.initial(MockFaqModel.empty().copyWith()));
  FaqState copyWith(
          {ApiResponse<MockFaqModel>? response}) =>
      FaqState(
          response: response ?? this.response);
}



 