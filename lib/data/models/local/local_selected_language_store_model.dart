import 'package:flutter_template/domain/entities/local/mock_local_selected_language_store_model.dart';

import '/domain/entities/local/mock_local_user_info_store_model.dart';

class LocalSelectedLanguageStoreModel {
  LocalSelectedLanguageStoreModel({required this.selectedLanguage});

  final String selectedLanguage;

  LocalSelectedLanguageStoreModel copyWith({String? selectedLanguage}) =>
      LocalSelectedLanguageStoreModel(
          selectedLanguage: selectedLanguage ?? this.selectedLanguage);

  factory LocalSelectedLanguageStoreModel.fromJson(String selectedLanguage) =>
      LocalSelectedLanguageStoreModel(selectedLanguage: selectedLanguage ?? "");

  Map<String, dynamic> toJson() => {"selectedLanguage": selectedLanguage};

  MockLocalSelectedLanguageStoreModel toDomain() =>
      MockLocalSelectedLanguageStoreModel(selectedLanguage: selectedLanguage);
}
