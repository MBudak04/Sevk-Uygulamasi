import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemleri_radio_firmalar.dart';
import 'package:neden_sevk_application/views/widgets/standart_text_form_field.dart';

class CuvalGirisView extends StatefulWidget {
  const CuvalGirisView({super.key});

  @override
  State<CuvalGirisView> createState() => _CuvalGirisPageState();
}

class _CuvalGirisPageState extends State<CuvalGirisView> {
  TextEditingController _controllerCID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ÇUVAL GİRİŞİ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: NedenColors.lacivert,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "SEVK EDEN FİRMA :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "",
                            style: TextStyle(
                                color: NedenColors.maroon,
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "SEVK EDEN PERSONEL :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " UBEYD SIRAC ÖZTÜRK",
                            style: TextStyle(
                                color: NedenColors.maroon,
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "TESLİM ALAN FİRMA :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " TRUVA TEKSTİL",
                            style: TextStyle(
                                color: NedenColors.maroon,
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "TESLİM ALAN PERSONEL :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " MÜCAHİT BUDAK",
                            style: TextStyle(
                                color: NedenColors.maroon,
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "İŞLEM :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " NEDEN TEKSTİL",
                            style: TextStyle(
                                color: NedenColors.maroon,
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "E - İRSALİYE :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " EVET",
                            style: TextStyle(
                                color: NedenColors.maroon,
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: StandartTextFormField(
                      etiketText: "ÇUVAL ID",
                      gizliMiCharacter: false,
                      gizliTextCharacter: "*",
                      textEditingController: _controllerCID,
                      gizlimiGosterGizle: false,
                      keyboardType: TextInputType.number,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
