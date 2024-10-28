import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/models/auth/splash/language_translations_model.dart';

class LanguageTranslationsDataSources extends Cubit<LanguageTranslationsModel> {
  String currentLang = 'en';

  LanguageTranslationsDataSources() : super(LanguageTranslationsModel.empty());
  setLanguageTranslationsDataSources(
          {required LanguageTranslationsModel languageTranslationsModel}) =>
      emit(languageTranslationsModel);
}
