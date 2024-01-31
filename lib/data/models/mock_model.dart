import 'package:cbtdmg/data/models/subject_model.dart';

class Mock {
  final List<Subject> subject1;
  final List<Subject> subject2;
  final List<Subject> subject3;
  final List<Subject> subject4;

  Mock({
    required this.subject1,
    required this.subject2,
    required this.subject3,
    required this.subject4,
  });

  factory Mock.fromJson(Map<String, dynamic> json) {
    return Mock(
      subject1: json['subject1'],
      subject2: json['subject2'],
      subject3: json['subject3'],
      subject4: json['subject4'],
    );
  }
}
