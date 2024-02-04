// ignore_for_file: prefer_const_constructors

import 'package:cbtdmg/utils/colors.dart';
import 'package:cbtdmg/utils/router.dart';
import 'package:cbtdmg/utils/text_size.dart';
import 'package:cbtdmg/views/screens/subject_list.dart';
import 'package:cbtdmg/views/shared/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "What would you like to do?",
              style: TextStyle(
                  fontSize: TextSize().h(context),
                  fontWeight: FontWeight.w600,
                  color: ceoPurple),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconButton(
                    text: "Answer Past Questions",
                    icon: FontAwesomeIcons.book,
                    onTap: () {
                      RouteController().push(context, SubjectListScreen());
                    }),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 5,
                // ),
                // CustomIconButton(
                //     text: "Take Mock Exam", icon: Icons.school, onTap: () {})
              ],
            )
          ]),
        ),
      ),
    );
  }
}
