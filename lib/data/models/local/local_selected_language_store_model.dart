class LocalSelectedLanguageStoreModel {
  LocalSelectedLanguageStoreModel({required this.selectedLanguage});

  final String selectedLanguage;

  LocalSelectedLanguageStoreModel copyWith({String? selectedLanguage}) =>
      LocalSelectedLanguageStoreModel(
          selectedLanguage: selectedLanguage ?? this.selectedLanguage);

  factory LocalSelectedLanguageStoreModel.fromJson(String selectedLanguage) =>
      LocalSelectedLanguageStoreModel(selectedLanguage: selectedLanguage ?? "");

  Map<String, dynamic> toJson() => {"selectedLanguage": selectedLanguage};
}
