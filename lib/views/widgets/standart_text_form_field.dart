import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class StandartTextFormField extends StatefulWidget {
  final String etiketText;
  bool gizliMiCharacter;
  final String gizliTextCharacter;
  final bool gizlimiGosterGizle;
  TextEditingController textEditingController = TextEditingController();

  StandartTextFormField(
      {super.key,
      required this.etiketText,
      required this.gizliMiCharacter,
      required this.gizliTextCharacter,
      required this.textEditingController,
      required this.gizlimiGosterGizle});

  @override
  State<StandartTextFormField> createState() => _StandartTextFormFieldState();
}

class _StandartTextFormFieldState extends State<StandartTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SizedBox(
        width: 80.w,
        height: Adaptive.h(10),
        child: TextFormField(
          controller: widget.textEditingController,
          style: NedenFonts.metinTextFormField,
          obscureText: widget.gizliMiCharacter,
          obscuringCharacter: widget.gizliTextCharacter,
          cursorColor: NedenColors.bal,
          decoration: InputDecoration(
            suffixIconColor: NedenColors.lacivert,
              suffixIcon: widget.gizlimiGosterGizle
                  ? IconButton(
                      icon: const Icon(Icons.remove_red_eye_rounded),
                      onPressed: () {
                        setState(() {
                          widget.gizliMiCharacter = !widget.gizliMiCharacter;
                        });
                      },
                    )
                  : null,
              labelText: widget.etiketText,
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
