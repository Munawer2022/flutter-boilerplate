import 'package:equatable/equatable.dart';

class MockLanguageTranslationsModel extends Equatable {
  const MockLanguageTranslationsModel({
    required this.error,
    required this.message,
    required this.data,
  });

  final bool error;
  final String message;
  final MockData? data;

  MockLanguageTranslationsModel copyWith({
    bool? error,
    String? message,
    MockData? data,
  }) {
    return MockLanguageTranslationsModel(
      error: error ?? this.error,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory MockLanguageTranslationsModel.empty() {
    return MockLanguageTranslationsModel(
      error: false,
      message: "",
      data: MockData.empty(),
    );
  }

  @override
  List<Object?> get props => [
        error,
        message,
        data,
      ];
}

class MockData extends Equatable {
  const MockData({
    required this.id,
    required this.name,
    required this.code,
    required this.fileName,
  });

  final int id;
  final String name;
  final String code;
  final MockFileName? fileName;

  MockData copyWith({
    int? id,
    String? name,
    String? code,
    MockFileName? fileName,
  }) {
    return MockData(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      fileName: fileName ?? this.fileName,
    );
  }

  factory MockData.empty() {
    return MockData(
      id: 0,
      name: "",
      code: "",
      fileName: MockFileName.empty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        fileName,
      ];
}

class MockFileName extends Equatable {
  const MockFileName({
    required this.hello,
  });

  final String hello;

  MockFileName copyWith({
    String? hello,
  }) {
    return MockFileName(
      hello: hello ?? this.hello,
    );
  }

  factory MockFileName.empty() {
    return const MockFileName(
      hello: "",
    );
  }

  @override
  List<Object?> get props => [
        hello,
      ];
}
