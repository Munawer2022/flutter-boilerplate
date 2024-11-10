import 'package:flutter_template/data/models/bottom_nav/home/home_model.dart';

import 'home_initial_params.dart';
import '../../../config/response/api_response.dart';

class HomeState {
  final ApiResponse<HomeModel> response;

  HomeState({required this.response});
  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      HomeState(response: ApiResponse.initial(HomeModel.empty()));
  HomeState copyWith({ApiResponse<HomeModel>? response}) =>
      HomeState(response: response ?? this.response);
}
