import 'package:ne_sever_mobile/models/Product.dart';

class ProductDetail {
  int urunId;
  String sku;
  String markaAdi;
  String urunAdi;
  String aciklama;
  String link;
  int hediyeSepetiSayisi;
  int goruntulenmeSayisi;
  List<String> resimler;
  String etiketler;
  List<Product> benzerUrunler;

  ProductDetail(
      {this.urunId,
      this.sku,
      this.markaAdi,
      this.urunAdi,
      this.aciklama,
      this.link,
      this.hediyeSepetiSayisi,
      this.goruntulenmeSayisi,
      this.resimler,
      this.etiketler,
      this.benzerUrunler});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    urunId = json['UrunId'];
    sku = json['Sku'];
    markaAdi = json['MarkaAdi'];
    urunAdi = json['UrunAdi'];
    aciklama = json['Aciklama'];
    link = json['Link'];
    hediyeSepetiSayisi = json['HediyeSepetiSayisi'];
    goruntulenmeSayisi = json['GoruntulenmeSayisi'];
    resimler = json['Resimler'].cast<String>();
    etiketler = json['Etiketler'];
    if (json['BenzerUrunler'] != null) {
      benzerUrunler = new List<Null>();
      json['BenzerUrunler'].forEach((v) {
        benzerUrunler.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UrunId'] = this.urunId;
    data['Sku'] = this.sku;
    data['MarkaAdi'] = this.markaAdi;
    data['UrunAdi'] = this.urunAdi;
    data['Aciklama'] = this.aciklama;
    data['Link'] = this.link;
    data['HediyeSepetiSayisi'] = this.hediyeSepetiSayisi;
    data['GoruntulenmeSayisi'] = this.goruntulenmeSayisi;
    data['Resimler'] = this.resimler;
    data['Etiketler'] = this.etiketler;
    if (this.benzerUrunler != null) {
      data['BenzerUrunler'] =
          this.benzerUrunler.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
