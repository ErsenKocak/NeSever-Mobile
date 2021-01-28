class Brand {
  int markaId;
  String markaAdi;
  String aciklama;
  String resimBase64;

  Brand({this.markaId, this.markaAdi, this.aciklama, this.resimBase64});

  Brand.fromJson(Map<String, dynamic> json) {
    markaId = json['MarkaId'];
    markaAdi = json['MarkaAdi'];
    aciklama = json['Aciklama'];
    resimBase64 = json['ResimBase64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MarkaId'] = this.markaId;
    data['MarkaAdi'] = this.markaAdi;
    data['Aciklama'] = this.aciklama;
    data['ResimBase64'] = this.resimBase64;
    return data;
  }
}
