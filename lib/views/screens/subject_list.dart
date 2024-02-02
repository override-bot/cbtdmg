// ignore_for_file: prefer_const_constructors

import 'package:cbtdmg/utils/router.dart';
import 'package:cbtdmg/viewmodels/past_questions_viewmodel.dart';
import 'package:cbtdmg/views/screens/year_list.dart';
import 'package:cbtdmg/views/shared/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/text_size.dart';

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({Key? key}) : super(key: key);

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<String>? subjectList;

  @override
  void initState() {
    super.initState();
    _loadSubjectList();
  }

  Future<void> _loadSubjectList() async {
    PastQuestionsViewmodel _pastQuestionsViewmodel =
        Provider.of<PastQuestionsViewmodel>(context, listen: false);

    try {
      List<String> subjects = await _pastQuestionsViewmodel.getSubjectList();
      setState(() {
        subjectList = subjects;
      });
    } catch (error) {
      // Handle error
      print("Error loading subject list: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    PastQuestionsViewmodel _pastQuestionsViewmodel =
        Provider.of<PastQuestionsViewmodel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select a subject",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h1(context)),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        color: Colors.white,
        child: subjectList == null
            ? Center(
                child: CircularProgressIndicator(
                  color: ceoPurple,
                ),
              )
            : GridView.builder(
                itemCount: subjectList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return CustomIconButton(
                    text: subjectList![index].toUpperCase(),
                    icon: FontAwesomeIcons.solidFile,
                    onTap: () {
                      _pastQuestionsViewmodel.setSubject(subjectList![index]);
                      RouteController().push(context, YearList());
                      print(_pastQuestionsViewmodel.currentRequest);
                    },
                  );
                },
              ),
      ),
    );
  }
}
