import 'package:cbtdmg/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/text_size.dart';

class Button extends StatelessWidget {
  final bool loading;
  final Function() onPressed;
  final String text;
  const Button(
      {Key? key,
      required this.onPressed,
      this.loading = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = loading
        ? Center(
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15,
                ),
                color: Colors.transparent,
                height: 55,
                width: MediaQuery.of(context).size.width / 1.1,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                )))
        : Center(
            child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 15,
            ),
            color: ceoPurple,
            height: 50,
            width: MediaQuery.of(context).size.width / 3.5,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: TextSize().h3(context),
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ));
    return MaterialButton(
      onPressed: loading == false ? onPressed : null,
      child: child,
    );
  }
}
