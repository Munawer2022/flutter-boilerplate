import 'package:flutter_bloc/flutter_bloc.dart';

class SplashDataSources extends Cubit<Map<String, dynamic>> {
  String currentLang = 'en';

  SplashDataSources() : super({});
  setSplashDataSources({required Map<String, dynamic> systemSettings}) =>
      emit(systemSettings);
}
