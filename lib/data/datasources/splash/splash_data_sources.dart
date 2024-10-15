import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/entities/splash/mock_splash_model.dart';

class SplashDataSources extends Cubit<MockSplashModel> {
  SplashDataSources() : super(const MockSplashModel.empty().copyWith());
  setSplashDataSources({required MockSplashModel mockSplashModel}) =>
      emit(mockSplashModel);
}
