// To parse this JSON data, do
//
//     final sevkBekleyenCuvallar = sevkBekleyenCuvallarFromJson(jsonString);


//SevkBekleyenCuvallar sevkBekleyenCuvallarFromJson(String str) => SevkBekleyenCuvallar.fromJson(json.decode(str));

//String sevkBekleyenCuvallarToJson(SevkBekleyenCuvallar data) => json.encode(data.toJson());

class SevkBekleyenCuvallarModel {
    String? artikel;
    int? cuvalId;
    int? talepId;
    int? renkId;
    String? renkAdi;
    int? urunAdet;
    String? model;
    String? beden;
    String? kg;
    String? atananFirma;
    String? fotografUrl;

    SevkBekleyenCuvallarModel({
        this.artikel,
        this.cuvalId,
        this.talepId,
        this.renkId,
        this.renkAdi,
        this.urunAdet,
        this.model,
        this.beden,
        this.kg,
        this.atananFirma,
        this.fotografUrl,
    });

    factory SevkBekleyenCuvallarModel.fromJson(Map<String, dynamic> json) => SevkBekleyenCuvallarModel(
        artikel: json["artikel"],
        cuvalId: json["cuval_id"],
        talepId: json["talep_id"],
        renkId: json["renk_id"],
        renkAdi: json["renk_adi"],
        urunAdet: json["urun_adet"],
        model: json["model"],
        beden: json["beden"],
        kg: json["kg"],
        atananFirma: json["atanan_firma"],
        fotografUrl: json["fotograf_url"],
    );

    Map<String, dynamic> toJson() => {
        "artikel": artikel,
        "cuval_id": cuvalId,
        "talep_id": talepId,
        "renk_id": renkId,
        "renk_adi": renkAdi,
        "urun_adet": urunAdet,
        "model": model,
        "beden": beden,
        "kg": kg,
        "atanan_firma": atananFirma,
        "fotograf_url": fotografUrl,
    };
}
