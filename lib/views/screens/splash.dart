// ignore_for_file: prefer_const_constructors

import 'package:cbtdmg/utils/colors.dart';
import 'package:cbtdmg/utils/router.dart';
import 'package:cbtdmg/utils/text_size.dart';
import 'package:cbtdmg/views/screens/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 4), () {
  //     RouteController().push(context, HomePage());
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "JAMB PRACTICE SOFTWARE",
              style: TextStyle(
                  color: purple,
                  fontSize: TextSize().h(context),
                  fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container()),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/undraw_road_to_knowledge_m8s0.png"))),
            ),
            Expanded(child: Container()),
            LinearProgressIndicator(
              color: purple,
            ),
            Text(
              "Please wait",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: TextSize().h3(context),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
