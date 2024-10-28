import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/models/auth/splash/pages_model.dart';

class PagesDataSources extends Cubit<PagesModel> {
  PagesDataSources() : super(PagesModel.empty());
  setPagesDataSources({required PagesModel pagesModel}) => emit(pagesModel);
}
