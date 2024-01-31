import 'options_model.dart';

class Question {
  final int id;
  final String question;
  final Option option;
  final String section;
  final String image;
  final String answer;
  final String solution;
  final String examType;
  final String examYear;

  Question({
    required this.id,
    required this.question,
    required this.option,
    required this.section,
    required this.image,
    required this.answer,
    required this.solution,
    required this.examType,
    required this.examYear,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      option: Option.fromJson(json['option']),
      section: json['section'],
      image: json['image'],
      answer: json['answer'],
      solution: json['solution'],
      examType: json['examtype'],
      examYear: json['examyear'],
    );
  }
}
