

  


import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages_web_view_initial_params.dart';
import 'pages_web_view_navigator.dart';
import 'pages_web_view_state.dart';

class PagesWebViewCubit extends Cubit<PagesWebViewState> {
  final PagesWebViewNavigator navigator;
  final PagesWebViewInitialParams initialParams;
PagesWebViewCubit(
  this.initialParams,
      this.navigator)
   : super(PagesWebViewState.initial(initialParams:initialParams));

}
