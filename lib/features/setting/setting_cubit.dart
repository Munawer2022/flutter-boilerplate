
import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_initial_params.dart';
import 'setting_navigator.dart';
import 'setting_state.dart';
import '/domain/repositories/setting/setting_base_api_service.dart';
import '/config/response/api_response.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingBaseApiService baseApiServices;
  final SettingNavigator navigator;
  final SettingInitialParams initialParams;
SettingCubit(
  this.initialParams,
      this.baseApiServices,
      this.navigator)
   : super(SettingState.initial(initialParams:initialParams));

Future<void> setting() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    final setting = await baseApiServices.setting();
    setting.fold(
      (l) => emit(state.copyWith(response: ApiResponse.error(l.error))),
      ((r) =>emit(state.copyWith(response: ApiResponse.completed(r)))));
  }
  Future<void> refresh() async =>
     setting();
  
}


  

