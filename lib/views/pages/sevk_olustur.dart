import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:neden_sevk_application/views/widgets/elevated_button_stadium.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemler_baslik.dart';
import 'package:neden_sevk_application/views/widgets/sevk_islemleri_radio_list.dart';

class SevkOlustur extends StatefulWidget {
  const SevkOlustur({super.key});

  @override
  State<SevkOlustur> createState() => _SevkOlusturState();
}

class _SevkOlusturState extends State<SevkOlustur> {
  bool option1 = false;
  

  @override
  void initState() {
    super.initState();

  }

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
                const SevkIslemlerRadio(),
                const SevkIslemlerBaslik(baslik: "SEVK EDEN PERSONEL"),
                const SevkIslemlerRadio(),
                const SevkIslemlerBaslik(baslik: "TESLİM ALAN FİRMA"),
                const SevkIslemlerRadio(),
                const SevkIslemlerBaslik(baslik: "TESLİM ALAN PERSONEL"),
                const SevkIslemlerRadio(),
                const SevkIslemlerBaslik(baslik: "İŞLEM"),
                const SevkIslemlerRadio(),
                const SevkIslemlerBaslik(baslik: "E-İRSALİYE KESİLECEK Mİ?"),
                const SevkIslemlerRadio(),
                StadiumElevatedButton(
                    yazi: "SEVK OLUŞTUR",
                    renk: NedenColors.lacivert,
                    font: NedenFonts.baslikBeyaz,
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
