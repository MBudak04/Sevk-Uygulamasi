import 'dart:convert';

class IslemlerModel {
    int? id;
    String? islem;

    IslemlerModel({
        this.id,
        this.islem,
    });

    factory IslemlerModel.fromRawJson(String str) => IslemlerModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IslemlerModel.fromJson(Map<String, dynamic> json) => IslemlerModel(
        id: json["id"],
        islem: json["islem"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "islem": islem,
    };
}