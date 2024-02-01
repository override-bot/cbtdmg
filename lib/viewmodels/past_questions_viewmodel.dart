import 'package:cbtdmg/data/repositories/past_questions_repository.dart';
import 'package:flutter/material.dart';

class PastQuestionsViewmodel extends ChangeNotifier {
  final PastQuestionRepository _pastQuestionRepository =
      PastQuestionRepository();
  Future<List<String>> getSubjectList() {
    return _pastQuestionRepository.getListOfSubjects();
  }
}
