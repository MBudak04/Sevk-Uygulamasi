import 'package:flutter/material.dart';
import 'package:neden_sevk_application/core/services/http_services.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SevkIslemlerRadioYesOrNo extends StatefulWidget {
  const SevkIslemlerRadioYesOrNo({super.key});

  @override
  State<SevkIslemlerRadioYesOrNo> createState() => _SevkIslemlerRadioState();
}

class _SevkIslemlerRadioState extends State<SevkIslemlerRadioYesOrNo> {
  List<String> list = [];
  List<String> list2 = [];
  List<String> searchList = [];
  String selectedIndex = "";
  int selectedValue = 0;
  TextEditingController controllerSear = TextEditingController();
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    // ignore: no_leading_underscores_for_local_identifiers
    void _focusDispose() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    }

    return GestureDetector(
      onTap: () => _focusDispose(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 80.w,
            height: Adaptive.h(38),
            decoration: BoxDecoration(
                color: NedenColors.beyaz,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 70.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: RadioMenuButton(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        child: Text("EVET")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 70.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: RadioMenuButton(
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (value) {setState(() {
                          selectedValue = value!;
                        });},
                        child: Text("HAYIR")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 75.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: Container(
                    width: 70.w,
                    height: Adaptive.h(5),
                    decoration: BoxDecoration(
                      color: NedenColors.lacivert,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      selectedValue == 1 ? "EVET" : selectedValue == 2 ? "HAYIR" : "SEÇİM YAPILMADI" ,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
