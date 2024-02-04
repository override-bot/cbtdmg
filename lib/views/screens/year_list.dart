// ignore_for_file: prefer_const_constructors

import 'package:cbtdmg/data/models/past_question_request.dart';
import 'package:cbtdmg/utils/generate_years.dart';
import 'package:cbtdmg/utils/router.dart';
import 'package:cbtdmg/views/screens/question_screen.dart';
import 'package:cbtdmg/views/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/text_size.dart';
import '../../viewmodels/past_questions_viewmodel.dart';

class YearList extends StatefulWidget {
  const YearList({super.key});

  @override
  State<YearList> createState() => _YearListState();
}

class _YearListState extends State<YearList> {
  @override
  Widget build(BuildContext context) {
    PastQuestionsViewmodel _pastQuestionsViewmodel =
        Provider.of<PastQuestionsViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select a year",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h1(context)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: generateYears(2001, 2020).length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                PopUp.popLoad(context);
                _pastQuestionsViewmodel
                    .setYear(generateYears(2001, 2020)[index]);
                _pastQuestionsViewmodel.setCurrentRequest(PastQuestionRequest(
                    subject: _pastQuestionsViewmodel.pastQuestionSubject,
                    year: _pastQuestionsViewmodel.pastQuestionYear));
                await _pastQuestionsViewmodel
                    .getPastQuestions(_pastQuestionsViewmodel.currentRequest!);
                print(_pastQuestionsViewmodel.pastQuestions.length);
                RouteController().pop(context);
                RouteController().push(context, QuestionScreen());
              },
              leading: Icon(
                Icons.calendar_month,
                color: ceoPurple,
              ),
              title: Text(
                generateYears(2001, 2020)[index],
                style: TextStyle(color: ceoPurple),
              ),
            );
          },
        ),
      ),
    );
  }
}
