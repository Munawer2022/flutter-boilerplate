import '/domain/entities/home/mock_home_model.dart';
import 'home_initial_params.dart';
import '/config/response/api_response.dart';

class HomeState {
  final ApiResponse<MockHomeModel> response;

  HomeState({required this.response});
  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      HomeState(
          response: ApiResponse.initial(MockHomeModel.empty().copyWith()));
  HomeState copyWith({ApiResponse<MockHomeModel>? response}) =>
      HomeState(response: response ?? this.response);
}
