class Product {
  int urunId;
  String sku;
  String markaAdi;
  String urunAdi;
  String resimUrl;
  String adresUrl;
  int hediyeSepetindekiUrunAdeti;

  Product(
      {this.urunId,
      this.sku,
      this.markaAdi,
      this.urunAdi,
      this.resimUrl,
      this.adresUrl,
      this.hediyeSepetindekiUrunAdeti});

  Product.fromJson(Map<String, dynamic> json) {
    urunId = json['UrunId'];
    sku = json['Sku'];
    markaAdi = json['MarkaAdi'];
    urunAdi = json['UrunAdi'];
    resimUrl = json['ResimUrl'];
    adresUrl = json['AdresUrl'];
    hediyeSepetindekiUrunAdeti = json['HediyeSepetindekiUrunAdeti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UrunId'] = this.urunId;
    data['Sku'] = this.sku;
    data['MarkaAdi'] = this.markaAdi;
    data['UrunAdi'] = this.urunAdi;
    data['ResimUrl'] = this.resimUrl;
    data['AdresUrl'] = this.adresUrl;
    data['HediyeSepetindekiUrunAdeti'] = this.hediyeSepetindekiUrunAdeti;
    return data;
  }
}
