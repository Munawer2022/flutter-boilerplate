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
  factory LanguageTranslationsModel.empty() {
    return LanguageTranslationsModel(
      error: false,
      message: "",
      data: Data.empty(),
    );
  }
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
  factory Data.empty() {
    return Data(
      id: 0,
      name: "",
      code: "",
      fileName: FileName.empty(),
    );
  }
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
  factory FileName.empty() {
    return FileName(
      hello: "",
    );
  }
}
