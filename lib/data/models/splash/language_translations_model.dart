import 'package:flutter_template/domain/entities/splash/mock_language_translations_model.dart';

class LanguageTranslationsModel {
  LanguageTranslationsModel({
    required this.error,
    required this.message,
    required this.data,
  });

  final bool error;
  final String message;
  final Data? data;

  factory LanguageTranslationsModel.fromJson(Map<String, dynamic> json) {
    return LanguageTranslationsModel(
      error: json["error"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
  MockLanguageTranslationsModel toDomain() => MockLanguageTranslationsModel(
      error: error, message: message, data: data?.toDomain());
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.code,
    required this.fileName,
  });

  final int id;
  final String name;
  final String code;
  final FileName? fileName;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      code: json["code"] ?? "",
      fileName: json["file_name"] == null
          ? null
          : FileName.fromJson(json["file_name"]),
    );
  }
  MockData toDomain() =>
      MockData(id: id, name: name, code: code, fileName: fileName?.toDomain());
}

class FileName {
  FileName({
    required this.hello,
  });

  final String hello;

  factory FileName.fromJson(Map<String, dynamic> json) {
    return FileName(
      hello: json["hello"] ?? "",
    );
  }
  MockFileName toDomain() => MockFileName(hello: hello);
}
