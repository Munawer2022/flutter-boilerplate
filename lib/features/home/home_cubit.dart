import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_initial_params.dart';
import 'home_navigator.dart';
import 'home_state.dart';
import '/domain/repositories/home/home_base_api_service.dart';
import '/config/response/api_response.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeBaseApiService baseApiServices;
  final HomeNavigator navigator;
  final HomeInitialParams initialParams;
  HomeCubit(this.initialParams, this.baseApiServices, this.navigator)
      : super(HomeState.initial(initialParams: initialParams));

  Future<void> home() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    final home = await baseApiServices.home();
    home.fold((l) => emit(state.copyWith(response: ApiResponse.error(l.error))),
        ((r) => emit(state.copyWith(response: ApiResponse.completed(r)))));
  }

  Future<void> refresh() async => home();
}
