import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:neden_sevk_application/core/feature/remember_me.dart';
import 'package:neden_sevk_application/core/models/firmalar_model.dart';
import 'package:neden_sevk_application/core/models/islemler_model.dart';
import 'package:neden_sevk_application/core/models/sevk_bekleyen_cuvallar_model.dart';
import 'package:neden_sevk_application/core/models/sevk_eden_personeller.dart';
import 'package:neden_sevk_application/core/services/api_endpoints.dart';
import 'package:neden_sevk_application/core/services/api_keys.dart';
import 'package:neden_sevk_application/views/widgets/snackbar_content.dart';

class ApiServices {
  //ŞİFREMİ UNUTTUM BUTONUNA TIKLANDIĞINDA ÇALIŞAN SERVİS
  Future<void> sifremiUnuttumService(
      String icerik, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(ApiEndpoints.sifremiUnuttum),
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: "javaScript=$icerik&pass=${ApiKeys.sifremiUnuttumKey}");
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarSucces(
            context, "Şifre Bilgilerin Whatsapp'a gönderildi :)");
      } else {
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarInfo(
            context, "Lütfen, internet bağlantını kontrol et!");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      SnackBarMessage.showSnackBarError(
          context, "Beklenmeyen bir hata oluştu ; '$e'");
    }
  }

//GİRİŞ YAP BUTONUNA TIKLANDIĞINDA ÇALIŞAN SERVİS

  Future<void> girisYapService(String kullaniciAdi, String sifre,
      bool rememberMe, BuildContext context) async {
        
    try {
      String gonderilecekVeri =
          '{"kullanici_adi" : "$kullaniciAdi","sifre" : "$sifre"}';
      final response = await http.post(Uri.parse(ApiEndpoints.girisYapKontrol),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: gonderilecekVeri);

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarSucces(context, "Giriş İşlemi Başarılı");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, "/HomeView");
        RememberMe().saveRememberMeStatus(rememberMe);
      } else {
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarError(context, "Kullanıcı adı veya Şifre yanlış!!");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      SnackBarMessage.showSnackBarError(context, "$e");
    }
  }

  // SEVK BEKLEYEN ÇUVALLARIN GET İŞLEMİ İLE ÇEKİLMESİ
  Future<List<SevkBekleyenCuvallarModel>> sevkBekleyenCuvallarService(
    BuildContext context,
  ) async {
    try {
      final response =
          await http.get(Uri.parse(ApiEndpoints.sevkBekleyenCuvallar));

      if (response.statusCode == 200) {
        Iterable list = jsonDecode(response.body);
        return List<SevkBekleyenCuvallarModel>.from(list.map((e) => SevkBekleyenCuvallarModel.fromJson(e)));
      } else {
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarError(context, "GÜNCEL VERİLER ÇEKİLEMEDİ");
        throw Exception("GÜNCEL VERİLER ÇEKİLEMEDİ");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
     SnackBarMessage.showSnackBarError(context, "$e");
     throw Exception(e);
     
    }
  }



  //SEVK OLUŞTUR SAYFASININ TÜM VERİLERİNİN GET İLE ÇEKİLMESİ
  Future<List<FirmalarModel>> sevkFirmalarService(BuildContext context) async {
      try{
        final response = await http.get(Uri.parse(ApiEndpoints.sevkFirmalar));

        if(response.statusCode == 200){
          Iterable list = jsonDecode(response.body);
          return List<FirmalarModel>.from(list.map((e) => FirmalarModel.fromJson(e)));
        }else{
          // ignore: use_build_context_synchronously
          SnackBarMessage.showSnackBarError(context, "FİRMALAR VERİTABANINDAN ALINAMADI");
          throw Exception("FİRMALAR VERİTABANINDAN ALINAMADI");
        }

      }catch(e){
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarError(context, "$e");
        throw Exception("CATCH : $e");
      }
  }



    Future<List<SevkEdenPersonellerModel>> sevkEdenPersonellerService(BuildContext context) async {
      try{
        final response = await http.get(Uri.parse(ApiEndpoints.sevkEdenPersoneller));

        if(response.statusCode == 200){
          Iterable list = jsonDecode(response.body);
          return List<SevkEdenPersonellerModel>.from(list.map((e) => SevkEdenPersonellerModel.fromJson(e)));
        }else{
          // ignore: use_build_context_synchronously
          SnackBarMessage.showSnackBarError(context, "FİRMALAR VERİTABANINDAN ALINAMADI");
          throw Exception("FİRMALAR VERİTABANINDAN ALINAMADI");
        }

      }catch(e){
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarError(context, "$e");
        throw Exception("CATCH : $e");
      }
  }

    Future<List<IslemlerModel>> islemlerService(BuildContext context) async {
      try{
        final response = await http.get(Uri.parse(ApiEndpoints.islemler));

        if(response.statusCode == 200){
          Iterable list = jsonDecode(response.body);
          return List<IslemlerModel>.from(list.map((e) => IslemlerModel.fromJson(e)));
        }else{
          // ignore: use_build_context_synchronously
          SnackBarMessage.showSnackBarError(context, "İŞLEMLER VERİTABANINDAN ALINAMADI");
          throw Exception("İŞLEMLER VERİTABANINDAN ALINAMADI");
        }

      }catch(e){
        // ignore: use_build_context_synchronously
        SnackBarMessage.showSnackBarError(context, "$e");
        throw Exception("CATCH : $e");
      }
  }



}
