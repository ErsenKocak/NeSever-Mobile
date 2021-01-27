class BannerModel {
  int bannerId;
  String aciklama1;
  String aciklama2;
  String link;
  String resimBase64;

  BannerModel(
      {this.bannerId,
      this.aciklama1,
      this.aciklama2,
      this.link,
      this.resimBase64});

  BannerModel.fromJson(Map<String, dynamic> json) {
    bannerId = json['BannerId'];
    aciklama1 = json['Aciklama1'];
    aciklama2 = json['Aciklama2'];
    link = json['Link'];
    resimBase64 = json['ResimBase64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BannerId'] = this.bannerId;
    data['Aciklama1'] = this.aciklama1;
    data['Aciklama2'] = this.aciklama2;
    data['Link'] = this.link;
    data['ResimBase64'] = this.resimBase64;
    return data;
  }
}
