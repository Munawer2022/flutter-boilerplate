import 'package:flutter_bloc/flutter_bloc.dart';

class SplashDataSources extends Cubit<Map<String, dynamic>> {
  SplashDataSources() : super({});
  setSplashDataSources({required Map<String, dynamic> splashModel}) =>
      emit(splashModel);
}
