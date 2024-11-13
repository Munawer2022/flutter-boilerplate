import 'package:flutter_bloc/flutter_bloc.dart';

class AppDataSources extends Cubit<Map<String, dynamic>> {
  String currentLang = 'en';

  AppDataSources() : super({});
  setSplashDataSources({required Map<String, dynamic> systemSettings}) =>
      emit(systemSettings);
}
