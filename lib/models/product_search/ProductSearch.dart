class ProductSearch {
  String siralama;
  String aramaKelime;
  String aramaKategori;
  String aramaMarka;
  String aramaSite;
  int start;
  int length;
  ProductSearch({
    this.siralama,
    this.aramaKelime,
    this.aramaKategori,
    this.aramaMarka,
    this.aramaSite,
    this.start,
    this.length,
  });

  Map<String, dynamic> toMap() {
    return {
      'Siralama': siralama,
      'AramaKelime': aramaKelime,
      'AramaKategori': aramaKategori,
      'AramaMarka': aramaMarka,
      'AramaSite': aramaSite,
      'Start': start,
      'Length': length,
    };
  }

  ProductSearch.fromJson(Map<String, dynamic> json) {
    siralama = json['Siralama'];
    aramaKelime = json['AramaKelime'];
    aramaKategori = json['AramaKategori'];
    aramaMarka = json['AramaMarka'];
    aramaSite = json['AramaSite'];
    start = json['Start'];
    length = json['Length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Siralama'] = this.siralama;
    data['AramaKelime'] = this.aramaKelime;
    data['AramaKategori'] = this.aramaKategori;
    data['AramaMarka'] = this.aramaMarka;
    data['AramaSite'] = this.aramaSite;
    data['Start'] = this.start;
    data['Length'] = this.length;
    return data;
  }
}
