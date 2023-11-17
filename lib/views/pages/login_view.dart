// ignore_for_file: void_checks
import 'package:flutter/material.dart';
import 'package:neden_sevk_application/core/services/http_services.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:neden_sevk_application/views/widgets/elevated_button_stadium.dart';
import 'package:neden_sevk_application/views/widgets/standart_text_form_field.dart';
import 'package:neden_sevk_application/views/widgets/text_button_underline.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMe = false;
  final TextEditingController _controllerK = TextEditingController();
  final TextEditingController _controllerS = TextEditingController();
  final TextEditingController _controllerTel = TextEditingController();

  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NedenColors.beyaz,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Adaptive.h(15),
            ),
            Container(
              width: 70.w,
              height: Adaptive.h(20),
              color: NedenColors.beyaz,
              child: Image.asset("lib/views/assets/images/logo-6.png"),
            ),
            SizedBox(
              height: Adaptive.h(5),
            ),
            Center(
                child: StandartTextFormField(
              textEditingController: _controllerK,
              etiketText: "Kullanıcı Adı",
              gizliMiCharacter: false,
              gizliTextCharacter: "*",
              gizlimiGosterGizle: false,
            )),
            StandartTextFormField(
              textEditingController: _controllerS,
              etiketText: "Şifre",
              gizliMiCharacter: true,
              gizliTextCharacter: "*",
              gizlimiGosterGizle: true,
            ),
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    "Beni Hatırla",
                    style: NedenFonts.metinTextFormField,
                  ),
                  SizedBox(width: 0.2.w),
                  Transform.scale(
                    scale: 1,
                    child: Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                      checkColor: NedenColors.beyaz,
                      activeColor: NedenColors.lacivert,
                    ),
                  ),
                ],
              ),
            ),
            StadiumElevatedButton(
              yazi: "GİRİŞ YAP",
              renk: NedenColors.lacivert,
              font: NedenFonts.baslikBeyaz,
              onPressed: () { 
                ApiServices().girisYapService(
                    _controllerK.text, _controllerS.text, rememberMe, context);
              },
            ),
            NedenTextButton(
              yazi: "Şifremi Unuttum",
              font: NedenFonts.metin1,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                        widthFactor: 0.9,
                        heightFactor: 0.4,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: StandartTextFormField(
                                    etiketText: "Telefon No",
                                    gizliMiCharacter: false,
                                    gizliTextCharacter: "*",
                                    textEditingController: _controllerTel,
                                    gizlimiGosterGizle: false),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: StadiumElevatedButton(
                                    yazi: "GÖNDER",
                                    renk: NedenColors.lacivert,
                                    font: NedenFonts.baslikBeyaz,
                                    onPressed: () {}),
                              ),
                              NedenTextButton(
                                  yazi: "VAZGEÇ",
                                  font: NedenFonts.metin1,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
