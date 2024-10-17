import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';

class LanguageTranslationsDataSources
    extends Cubit<MockLanguageTranslationsModel> {
  LanguageTranslationsDataSources()
      : super(MockLanguageTranslationsModel.empty().copyWith());
  setLanguageTranslationsDataSources(
          {required MockLanguageTranslationsModel
              mockLanguageTranslationsModel}) =>
      emit(mockLanguageTranslationsModel);
}
