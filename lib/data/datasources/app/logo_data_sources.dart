import 'package:flutter_bloc/flutter_bloc.dart';

class LogoDataSources extends Cubit<String> {
  LogoDataSources() : super('');
  setLogoBase64DataSources({required String logoBase64}) => emit(logoBase64);
}
