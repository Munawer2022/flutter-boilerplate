import 'package:equatable/equatable.dart';

class MockLocalSelectedLanguageStoreModel extends Equatable {
  const MockLocalSelectedLanguageStoreModel({required this.selectedLanguage});

  final String selectedLanguage;

  MockLocalSelectedLanguageStoreModel copyWith({String? selectedLanguage}) {
    return MockLocalSelectedLanguageStoreModel(
        selectedLanguage: selectedLanguage ?? this.selectedLanguage);
  }

  factory MockLocalSelectedLanguageStoreModel.fromJson(
          String selectedLanguage) =>
      MockLocalSelectedLanguageStoreModel(
          selectedLanguage: selectedLanguage ?? "");

  factory MockLocalSelectedLanguageStoreModel.empty() =>
      const MockLocalSelectedLanguageStoreModel(selectedLanguage: '');

  Map<String, dynamic> toJson() => {"selectedLanguage": selectedLanguage};

  @override
  List<Object?> get props => [selectedLanguage];
}
