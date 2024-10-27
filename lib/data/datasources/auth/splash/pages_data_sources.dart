import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/entities/splash/mock_pages_model.dart';

class PagesDataSources extends Cubit<MockPagesModel> {
  PagesDataSources() : super(MockPagesModel.empty().copyWith());
  setPagesDataSources({required MockPagesModel mockPagesModel}) =>
      emit(mockPagesModel);
}
