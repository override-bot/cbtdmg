import 'question_model.dart';

class Subject {
  final String subjectName;
  final List<Question> questions;

  Subject({
    required this.subjectName,
    required this.questions,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    var questionsList = json['data'] as List;
    List<Question> questions =
        questionsList.map((e) => Question.fromJson(e)).toList();

    return Subject(
      subjectName: json['subject'],
      questions: questions,
    );
  }
}
