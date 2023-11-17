import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class CuvalIdTextFormField extends StatelessWidget {
  final String etiketText;
  final bool gizliMi;
  final String gizliTextCharacter;
  TextEditingController textEditingController = TextEditingController();

  CuvalIdTextFormField(
      {super.key,
      required this.etiketText,
      required this.gizliMi,
      required this.gizliTextCharacter,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SizedBox(
        width: 80.w,
        height: Adaptive.h(10),
        child: TextFormField(
          controller: textEditingController,
          style: NedenFonts.metinTextFormField,
          obscureText: gizliMi,
          obscuringCharacter: gizliTextCharacter,
          cursorColor: NedenColors.bal,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: etiketText,
              labelStyle: NedenFonts.metinTextFormField,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 4.0, color: NedenColors.bal),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 4.0, color: NedenColors.lacivert),
              )),
        ),
      ),
    );
  }
}
