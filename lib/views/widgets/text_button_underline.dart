import 'package:flutter/material.dart';

class NedenTextButton extends StatelessWidget {
  final String yazi;
  final TextStyle font;
  final Function onPressed;
  const NedenTextButton(
      {super.key,
      required this.yazi,
      required this.font,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          yazi,
          style: font,
        ));
  }
}
