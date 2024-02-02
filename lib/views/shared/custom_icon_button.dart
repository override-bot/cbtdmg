// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_size.dart';

class CustomIconButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  CustomIconButton(
      {required this.text, required this.icon, required this.onTap});

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: ceoPurple,
              size: TextSize().custom(150, context),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: ceoPurple,
                fontSize: TextSize().h1(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
