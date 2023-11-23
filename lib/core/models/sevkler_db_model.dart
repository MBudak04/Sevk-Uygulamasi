class SevklerDB {
  int? id;
  int? sevkEdenPersonelID;
  int? sevkEdenFirmaID;
  int? teslimAlanPersonelID;
  int? teslimAlanFirmaID;
  int? islemID;
  String? cuvallarID;
  String? sevkEdenPersonel;
  String? sevkEdenFirma;
  String? teslimAlanPersonel;
  String? teslimAlanFirma;
  String? islem;
  String? eIrsaliye;

  SevklerDB({
    this.id,
    required this.sevkEdenPersonelID,
    required this.sevkEdenFirmaID,
    required this.teslimAlanPersonelID,
    required this.teslimAlanFirmaID,
    required this.islemID,
    required this.cuvallarID,
    required this.sevkEdenPersonel,
    required this.sevkEdenFirma,
    required this.teslimAlanPersonel,
    required this.teslimAlanFirma,
    required this.islem,
    required this.eIrsaliye,
  });

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "sevkEdenPersonelID": sevkEdenPersonelID,
      "sevkEdenFirmaID": sevkEdenFirmaID,
      "teslimAlanPersonelID": teslimAlanPersonelID,
      "teslimAlanFirmaID": teslimAlanFirmaID,
      "islemID": islemID,
      "cuvallarID": cuvallarID,
      "sevkEdenPersonel": sevkEdenPersonel,
      "sevkEdenFirma": sevkEdenFirma,
      "teslimAlanPersonel": teslimAlanPersonel,
      "teslimAlanFirma": teslimAlanFirma,
      "islem": islem,
      "eIrsaliye" : eIrsaliye
    };
    if(id != null){
      map["id"] = id;
    }
    return map;
  }

  SevklerDB.fromMap(Map<dynamic,dynamic> map){
    id = map["id"] as int?;
    sevkEdenPersonelID = map["sevkEdenPersonelID"] as int?;
    sevkEdenFirmaID = map["sevkEdenFirmaID"] as int?;
    teslimAlanPersonelID = map["teslimAlanPersonelID"] as int?;
    teslimAlanFirmaID = map["teslimAlanFirmaID"] as int?;
    islemID = map["islemID"] as int?;
    cuvallarID = map["cuvallarID"] as String?;
    sevkEdenPersonel = map["sevkEdenPersonel"] as String?;
    sevkEdenFirma = map["sevkEdenFirma"] as String?;
    teslimAlanPersonel = map["teslimAlanPersonel"] as String?;
    teslimAlanFirma = map["teslimAlanFirma"] as String?;
    islem = map["islem"] as String?;
    eIrsaliye = map["eIrsaliye"] as String?;



  }


}
