import 'package:flutter/material.dart';

class StadiumElevatedButton extends StatelessWidget {
  final String yazi;
  final Color renk;
  final TextStyle font;
  final Function onPressed;

  const StadiumElevatedButton(
      {super.key, required this.yazi, required this.renk, required this.font,  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {onPressed();},
        style: ElevatedButton.styleFrom(
            backgroundColor: renk, shape: const StadiumBorder()),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 50.0, right: 50.0, top: 18.0, bottom: 8.0),
          child: Text(
            yazi,
            style: font,
          ),
        ),
      ),
    );
  }
}
