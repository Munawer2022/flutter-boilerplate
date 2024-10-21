import 'package:equatable/equatable.dart';

class MockPagesModel extends Equatable {
  const MockPagesModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<MockDatum> data;

  MockPagesModel copyWith({
    String? status,
    List<MockDatum>? data,
  }) {
    return MockPagesModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory MockPagesModel.empty() {
    return const MockPagesModel(status: "", data: []);
  }

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class MockDatum extends Equatable {
  const MockDatum({
    required this.id,
    required this.name,
    required this.slug,
    required this.content,
    required this.nameAr,
    required this.contentAr,
    required this.link,
  });

  final int id;
  final String name;
  final String slug;
  final String content;
  final String nameAr;
  final String contentAr;
  final String link;

  MockDatum copyWith({
    int? id,
    String? name,
    String? slug,
    String? content,
    String? nameAr,
    String? contentAr,
    String? link,
  }) {
    return MockDatum(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      content: content ?? this.content,
      nameAr: nameAr ?? this.nameAr,
      contentAr: contentAr ?? this.contentAr,
      link: link ?? this.link,
    );
  }

  factory MockDatum.empty() {
    return const MockDatum(
      id: 0,
      name: "",
      slug: "",
      content: "",
      nameAr: "",
      contentAr: "",
      link: "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        content,
        nameAr,
        contentAr,
        link,
      ];
}
