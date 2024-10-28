import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';

class SplashDataSources extends Cubit<Map<String, dynamic>> {
  SplashDataSources() : super({});
  setSplashDataSources({required Map<String, dynamic> splashModel}) =>
      emit(splashModel);
}
