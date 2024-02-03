// ignore_for_file: prefer_const_constructors

import 'package:cbtdmg/data/models/question_model.dart';
import 'package:cbtdmg/utils/router.dart';

import 'package:cbtdmg/views/shared/butto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/text_size.dart';
import '../../viewmodels/past_questions_viewmodel.dart';
import 'home_page.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    PastQuestionsViewmodel _pastQuestionsViewmodel =
        Provider.of<PastQuestionsViewmodel>(context);
    List<Question> questions = _pastQuestionsViewmodel.pastQuestions;
    int currentIndex = _pastQuestionsViewmodel.currentAnswerNumber;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _pastQuestionsViewmodel.resetAnswerNumber();
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
              'Questions number: ${_pastQuestionsViewmodel.currentAnswerNumber + 1} / ${questions.length}',
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
            Text(
              "Answer: ${questions[currentIndex].answer}. ${_pastQuestionsViewmodel.getAnswerFromOption(questions[currentIndex].option, questions[currentIndex].answer)}",
              style: TextStyle(
                  color: ceoPurple,
                  fontSize: TextSize().h2(context),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              questions[currentIndex].solution,
              style: TextStyle(
                  color: ceoPurpleGrey,
                  fontSize: TextSize().h2(context),
                  fontWeight: FontWeight.w400),
            ),
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
                        _pastQuestionsViewmodel
                            .previousAnswer(questions.length);
                      },
                      text: "Previous"),
                  Button(
                      onPressed: () {
                        _pastQuestionsViewmodel.nextAnswer(questions.length);
                      },
                      text: "Next"),
                  Button(
                      onPressed: () {
                        RouteController().push(context, HomePage());
                        _pastQuestionsViewmodel.end();
                      },
                      text: "Return to home"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
