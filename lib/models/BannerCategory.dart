class BannerCategory {
  int kategoriBannerId;
  Null ustKategoriId;
  String adi;
  Null aciklama;
  String resim;
  String parametre;
  bool anasayfadaGoster;

  BannerCategory(
      {this.kategoriBannerId,
      this.ustKategoriId,
      this.adi,
      this.aciklama,
      this.resim,
      this.parametre,
      this.anasayfadaGoster});

  BannerCategory.fromJson(Map<String, dynamic> json) {
    kategoriBannerId = json['KategoriBannerId'];
    ustKategoriId = json['UstKategoriId'];
    adi = json['Adi'];
    aciklama = json['Aciklama'];
    resim = json['Resim'];
    parametre = json['Parametre'];
    anasayfadaGoster = json['AnasayfadaGoster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KategoriBannerId'] = this.kategoriBannerId;
    data['UstKategoriId'] = this.ustKategoriId;
    data['Adi'] = this.adi;
    data['Aciklama'] = this.aciklama;
    data['Resim'] = this.resim;
    data['Parametre'] = this.parametre;
    data['AnasayfadaGoster'] = this.anasayfadaGoster;
    return data;
  }
}
