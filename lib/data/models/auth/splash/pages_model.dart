import 'package:flutter_template/domain/entities/splash/mock_pages_model.dart';

class PagesModel {
  PagesModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory PagesModel.fromJson(Map<String, dynamic> json) {
    return PagesModel(
      status: json["status"] ?? "",
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
  MockPagesModel toDomain() => MockPagesModel(
        status: status,
        data: data.map((datum) => datum.toDomain()).toList(),
      );
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      content: json["content"] ?? "",
      nameAr: json["name_ar"] ?? "",
      contentAr: json["content_ar"] ?? "",
      link: json["link"] ?? "",
    );
  }
  MockDatum toDomain() => MockDatum(
      id: id,
      name: name,
      slug: slug,
      content: content,
      nameAr: nameAr,
      contentAr: contentAr,
      link: link);
}
