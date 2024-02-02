// ignore_for_file: prefer_const_constructors

import 'package:cbtdmg/data/models/answered_question_model.dart';
import 'package:cbtdmg/data/models/question_model.dart';
import 'package:cbtdmg/utils/router.dart';
import 'package:cbtdmg/views/screens/result_screen.dart';
import 'package:cbtdmg/views/shared/butto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/text_size.dart';
import '../../viewmodels/past_questions_viewmodel.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    PastQuestionsViewmodel _pastQuestionsViewmodel =
        Provider.of<PastQuestionsViewmodel>(context);
    List<Question> questions = _pastQuestionsViewmodel.pastQuestions;
    int currentIndex = _pastQuestionsViewmodel.currentNumber;
    String? groupV =
        _pastQuestionsViewmodel.showQuestion(currentIndex)?.selectedAnswer ??
            "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _pastQuestionsViewmodel.clearAnswers();
              RouteController().pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: ceoPurple,
            )),
        title: Text(
          _pastQuestionsViewmodel.currentRequest?.subject?.toUpperCase() ?? "",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h1(context)),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Questions answered: ${_pastQuestionsViewmodel.answeredQuestions.length} / ${questions.length}',
              style: TextStyle(
                  color: ceoPurpleGrey,
                  fontSize: TextSize().h3(context),
                  fontWeight: FontWeight.w600),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            HtmlWidget(questions[currentIndex].section,
                textStyle: TextStyle(
                    color: ceoPurple,
                    fontSize: TextSize().h3(context),
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 10,
            ),
            HtmlWidget(
              '${currentIndex + 1}. ${questions[currentIndex].question}',
              textStyle: TextStyle(
                  color: ceoPurple,
                  fontSize: TextSize().h1(context),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
                title: Text('a. ${questions[currentIndex].option.a}'),
                value: questions[currentIndex].option.a,
                groupValue: groupV,
                onChanged: (value) {
                  AnsweredModel data = AnsweredModel(
                      correctOption: questions[currentIndex].answer,
                      questionNumber: currentIndex,
                      selectedAnswer: value ?? "",
                      selectedOption: "a");
                  _pastQuestionsViewmodel.updateAnswers(data);
                  _pastQuestionsViewmodel.showQuestion(currentIndex);

                  //  print(groupV);
                }),
            RadioListTile(
                title: Text('b. ${questions[currentIndex].option.b}'),
                value: questions[currentIndex].option.b,
                groupValue: groupV,
                onChanged: (value) {
                  AnsweredModel data = AnsweredModel(
                      correctOption: questions[currentIndex].answer,
                      questionNumber: currentIndex,
                      selectedAnswer: value ?? "",
                      selectedOption: "b");
                  _pastQuestionsViewmodel.updateAnswers(data);
                  _pastQuestionsViewmodel.showQuestion(currentIndex);
                }),
            RadioListTile(
                title: Text('c. ${questions[currentIndex].option.c}'),
                value: questions[currentIndex].option.c,
                groupValue: groupV,
                onChanged: (value) {
                  AnsweredModel data = AnsweredModel(
                      correctOption: questions[currentIndex].answer,
                      questionNumber: currentIndex,
                      selectedAnswer: value ?? "",
                      selectedOption: "c");
                  _pastQuestionsViewmodel.updateAnswers(data);
                  _pastQuestionsViewmodel.showQuestion(currentIndex);
                }),
            RadioListTile(
                title: Text('d. ${questions[currentIndex].option.d}'),
                value: questions[currentIndex].option.d,
                groupValue: groupV,
                onChanged: (value) {
                  AnsweredModel data = AnsweredModel(
                      correctOption: questions[currentIndex].answer,
                      questionNumber: currentIndex,
                      selectedAnswer: value ?? "",
                      selectedOption: "d");
                  _pastQuestionsViewmodel.updateAnswers(data);
                  _pastQuestionsViewmodel.showQuestion(currentIndex);
                }),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Button(
                      onPressed: () {
                        _pastQuestionsViewmodel.previous(questions.length);
                      },
                      text: "Previous"),
                  Button(
                      onPressed: () {
                        _pastQuestionsViewmodel.next(questions.length);
                      },
                      text: "Next"),
                  Button(
                      onPressed: () {
                        RouteController().push(context, ResultScreen());
                      },
                      text: "Submit"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
