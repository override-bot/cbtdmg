import 'package:cbtdmg/views/screens/answer_screen.dart';
import 'package:cbtdmg/views/screens/home_page.dart';
import 'package:cbtdmg/views/shared/butto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/router.dart';
import '../../utils/text_size.dart';
import '../../viewmodels/past_questions_viewmodel.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    PastQuestionsViewmodel _pastQuestionsViewmodel =
        Provider.of<PastQuestionsViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _pastQuestionsViewmodel.clearAnswers();
              _pastQuestionsViewmodel.resetNumber();
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
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score is:",
              style: TextStyle(
                  color: ceoPurpleGrey,
                  fontSize: TextSize().h1(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              _pastQuestionsViewmodel.getInHunds().toString(),
              style: TextStyle(
                  color: ceoPurple,
                  fontSize: TextSize().custom(35, context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '(${_pastQuestionsViewmodel.getScore().toString()}/${_pastQuestionsViewmodel.pastQuestions.length})',
              style: TextStyle(
                  color: ceoPurpleGrey,
                  fontSize: TextSize().h2(context),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Button(
                onPressed: () {
                  RouteController().push(context, HomePage());
                  _pastQuestionsViewmodel.end();
                },
                text: "Return to home"),
            Button(
                onPressed: () {
                  RouteController().push(context, AnswerScreen());
                },
                text: "View answers")
          ],
        ),
      ),
    );
  }
}
