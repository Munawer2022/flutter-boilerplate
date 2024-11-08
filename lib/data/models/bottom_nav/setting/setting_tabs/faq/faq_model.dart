class FaqModel {
  final List<FaqItem> data;

  FaqModel({
    required this.data,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    return FaqModel(
      data: dataList.map((item) => FaqItem.fromJson(item)).toList(),
    );
  }

  factory FaqModel.empty() => FaqModel(data: []);
}

class FaqItem {
  final int id;
  final String question;
  final String questionAr;
  final String? image;
  final String answer;
  final String answerAr;

  FaqItem({
    required this.id,
    required this.question,
    required this.questionAr,
    this.image,
    required this.answer,
    required this.answerAr,
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      id: json['id'],
      question: json['question'],
      questionAr: json['question_ar'],
      image: json['image'],
      answer: json['answer'],
      answerAr: json['answer_ar'],
    );
  }
}
