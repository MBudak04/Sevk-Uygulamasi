class FirmalarModel {
    int? firmaId;
    String? firmaAdi;

    FirmalarModel({
        this.firmaId,
        this.firmaAdi,
    });

    factory FirmalarModel.fromJson(Map<String, dynamic> json) => FirmalarModel(
        firmaId: json["firma_id"],
        firmaAdi: json["firma_adi"],
    );

    Map<String, dynamic> toJson() => {
        "firma_id": firmaId,
        "firma_adi": firmaAdi,
    };

  toLowerCase() {}
}