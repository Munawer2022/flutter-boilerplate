
import 'package:flutter_bloc/flutter_bloc.dart';
import 'faq_initial_params.dart';
import 'faq_navigator.dart';
import 'faq_state.dart';
import '../../../../../domain/repositories/bottom_nav/setting/setting_tabs/faq/faq_base_api_service.dart';
import '/config/response/api_response.dart';

class FaqCubit extends Cubit<FaqState> {
  final FaqBaseApiService baseApiServices;
  final FaqNavigator navigator;
  final FaqInitialParams initialParams;
FaqCubit(
  this.initialParams,
      this.baseApiServices,
      this.navigator)
   : super(FaqState.initial(initialParams:initialParams));

Future<void> faq() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    final faq = await baseApiServices.faq();
    faq.fold(
      (l) => emit(state.copyWith(response: ApiResponse.error(l.error))),
      ((r) =>emit(state.copyWith(response: ApiResponse.completed(r)))));
  }
  Future<void> refresh() async =>
     faq();
  
}


  

