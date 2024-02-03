import 'package:cbtdmg/utils/colors.dart';
import 'package:flutter/material.dart';

class PopUp {
  static Future popLoad(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(),
            elevation: 0.0,
            insetPadding: EdgeInsets.zero,
            child: Container(
                // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ceoPurple,
                  ),
                )),
          );
        });
  }
}
