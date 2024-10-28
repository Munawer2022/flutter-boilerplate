import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/faq/faq_model.dart';

import 'faq_initial_params.dart';
import '/config/response/api_response.dart';

class FaqState {
  final ApiResponse<FaqModel> response;

  FaqState({required this.response});
  factory FaqState.initial({required FaqInitialParams initialParams}) =>
      FaqState(response: ApiResponse.initial(FaqModel.empty()));
  FaqState copyWith({ApiResponse<FaqModel>? response}) =>
      FaqState(response: response ?? this.response);
}
