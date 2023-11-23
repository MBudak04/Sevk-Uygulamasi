import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:neden_sevk_application/views/widgets/elevated_button_stadium.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemler_baslik.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemleri_radio_firmalar.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemleri_radio_islemler.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemleri_radio_sevk_personeller.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemleri_radio_yes_or_no.dart';

class SevkOlustur extends StatefulWidget {
  const SevkOlustur({super.key});

  @override
  State<SevkOlustur> createState() => _SevkOlusturState();
}

class _SevkOlusturState extends State<SevkOlustur> {
  bool option1 = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NedenColors.lacivert,
        centerTitle: true,
        title: Text(
          "SEVK OLUŞTUR",
          style: NedenFonts.baslikBeyaz,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8, bottom: 8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SevkIslemlerBaslik(baslik: "SEVK EDEN FİRMA"),
                const SevkIslemlerRadioFirmalar(),
                const SevkIslemlerBaslik(baslik: "SEVK EDEN PERSONEL"),
                const SevkIslemlerRadioSevkPersoneller(),
                const SevkIslemlerBaslik(baslik: "TESLİM ALAN FİRMA"),
                const SevkIslemlerRadioFirmalar(),
                const SevkIslemlerBaslik(baslik: "TESLİM ALAN PERSONEL"),
                const SevkIslemlerRadioSevkPersoneller(),
                const SevkIslemlerBaslik(baslik: "İŞLEM"),
                const SevkIslemlerRadioIslemler(),
                const SevkIslemlerBaslik(baslik: "E-İRSALİYE KESİLECEK Mİ?"),
                const SevkIslemlerRadioYesOrNo(),
                StadiumElevatedButton(
                    yazi: "SEVK OLUŞTUR",
                    renk: NedenColors.lacivert,
                    font: NedenFonts.baslikBeyaz,
                    onPressed: () {
                      Navigator.pushNamed(context, "/CuvalGirisView");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
