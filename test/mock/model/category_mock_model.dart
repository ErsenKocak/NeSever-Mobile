// To parse this JSON data, do
//
//     final categoryMockModel = categoryMockModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CategoryMockModel {
  CategoryMockModel({
    @required this.ustKategoriId,
    @required this.kategoriId,
    @required this.parametre,
    @required this.kategoriAdi,
    @required this.aciklama,
    @required this.sira,
    @required this.anasayfadaGoster,
  });

  final int ustKategoriId;
  final int kategoriId;
  final String parametre;
  final String kategoriAdi;
  final dynamic aciklama;
  final int sira;
  final bool anasayfadaGoster;

  factory CategoryMockModel.fromRawJson(String str) =>
      CategoryMockModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryMockModel.fromJson(Map<String, dynamic> json) =>
      CategoryMockModel(
        ustKategoriId:
            json["UstKategoriId"] == null ? null : json["UstKategoriId"],
        kategoriId: json["KategoriId"],
        parametre: json["Parametre"],
        kategoriAdi: json["KategoriAdi"],
        aciklama: json["Aciklama"],
        sira: json["Sira"],
        anasayfadaGoster: json["AnasayfadaGoster"],
      );

  Map<String, dynamic> toJson() => {
        "UstKategoriId": ustKategoriId == null ? null : ustKategoriId,
        "KategoriId": kategoriId,
        "Parametre": parametre,
        "KategoriAdi": kategoriAdi,
        "Aciklama": aciklama,
        "Sira": sira,
        "AnasayfadaGoster": anasayfadaGoster,
      };
}
