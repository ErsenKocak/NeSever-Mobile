// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CategoryModel {
  CategoryModel({
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

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        ustKategoriId:
            json["UstKategoriId"] == null ? null : json["UstKategoriId"],
        kategoriId: json["KategoriId"],
        parametre: json["Parametre"],
        kategoriAdi: json["KategoriAdi"],
        aciklama: json["Aciklama"],
        sira: json["Sira"],
        anasayfadaGoster: json["AnasayfadaGoster"],
      );

  Map<String, dynamic> toMap() => {
        "UstKategoriId": ustKategoriId == null ? null : ustKategoriId,
        "KategoriId": kategoriId,
        "Parametre": parametre,
        "KategoriAdi": kategoriAdi,
        "Aciklama": aciklama,
        "Sira": sira,
        "AnasayfadaGoster": anasayfadaGoster,
      };
}
