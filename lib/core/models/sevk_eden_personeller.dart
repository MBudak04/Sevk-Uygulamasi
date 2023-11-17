class SevkEdenPersonellerModel {
    int? id;
    String? personelAdi;
    String? personelSoyadi;

    SevkEdenPersonellerModel({
        this.id,
        this.personelAdi,
        this.personelSoyadi,
    });

    factory SevkEdenPersonellerModel.fromJson(Map<String, dynamic> json) => SevkEdenPersonellerModel(
        id: json["id"],
        personelAdi: json["personel_adi"],
        personelSoyadi: json["personel_soyadi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "personel_adi": personelAdi,
        "personel_soyadi": personelSoyadi,
    };
}