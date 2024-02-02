import 'package:cbtdmg/data/models/answered_question_model.dart';
import 'package:cbtdmg/data/models/past_question_request.dart';
import 'package:cbtdmg/data/repositories/past_questions_repository.dart';
import 'package:flutter/material.dart';

import '../data/models/question_model.dart';

class PastQuestionsViewmodel extends ChangeNotifier {
  final PastQuestionRepository _pastQuestionRepository =
      PastQuestionRepository();
  List<AnsweredModel> _answeredQuestions = [];
  List<AnsweredModel> get answeredQuestions => _answeredQuestions;
  clearAnswers() {
    _answeredQuestions.clear();
    notifyListeners();
  }

  void end() {
    _currentNumber = 0;
    _answeredQuestions.clear();
    _currentRequest = null;
    _pastQuestions.clear();
    notifyListeners();
  }

  void updateAnswers(AnsweredModel question) {
    final index = _answeredQuestions.indexWhere(
        (element) => element.questionNumber == question.questionNumber);
    if (index != -1) {
      _answeredQuestions[index] = question;
    } else {
      _answeredQuestions.add(question);
    }
    notifyListeners();
  }

  AnsweredModel? showQuestion(int number) {
    final index = _answeredQuestions
        .indexWhere((element) => element.questionNumber == number);
    if (index != -1) {
      return _answeredQuestions[index];
    } else {
      return null;
    }
  }

  int _currentNumber = 0;
  int get currentNumber => _currentNumber;
  void next(total) {
    if (_currentNumber < total - 1) {
      _currentNumber++;
    } else {
      _currentNumber = 0;
    }
    notifyListeners();
  }

  resetNumber() {
    _currentNumber = 0;
    notifyListeners();
  }

  void previous(total) {
    if (_currentNumber > 0) {
      _currentNumber--;
    }
    notifyListeners();
  }

  int getScore() {
    List<AnsweredModel> correctAnswers = _answeredQuestions
        .where((element) => element.correctOption == element.selectedOption)
        .toList();
    return correctAnswers.length;
  }

  int getInHunds() {
    double percent = (getScore() / _pastQuestions.length) * 100;
    return percent.floor();
  }

  PastQuestionRequest? _currentRequest;
  PastQuestionRequest? get currentRequest => _currentRequest;
  setCurrentRequest(req) {
    _currentRequest = req;
  }

  String? _pastQuestionYear;
  String? get pastQuestionYear => _pastQuestionYear;
  setYear(year) {
    _pastQuestionYear = year;
  }

  String? _pastQuestionSubject;
  String? get pastQuestionSubject => _pastQuestionSubject;
  setSubject(subject) {
    _pastQuestionSubject = subject;
  }

  Future<List<String>> getSubjectList() {
    return _pastQuestionRepository.getListOfSubjects();
  }

  List<Question> _pastQuestions = [];
  List<Question> get pastQuestions => _pastQuestions;
  setPastQuestions(questions) {
    _pastQuestions = questions;
  }

  Future<void> getPastQuestions(PastQuestionRequest data) async {
    List<Question> results =
        await _pastQuestionRepository.getPastQuestions(data);
    setPastQuestions(results);
  }
}
