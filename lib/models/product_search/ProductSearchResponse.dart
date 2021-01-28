import 'package:ne_sever_mobile/models/Metadata.dart';
import 'package:ne_sever_mobile/models/Product.dart';

class ProductSearchResponse {
  List<Product> items;
  MetaData metaData;

  ProductSearchResponse({this.items, this.metaData});

  ProductSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Product>();
      json['items'].forEach((v) {
        items.add(new Product.fromJson(v));
      });
    }
    metaData = json['metaData'] != null
        ? new MetaData.fromJson(json['metaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    if (this.metaData != null) {
      data['metaData'] = this.metaData.toJson();
    }
    return data;
  }
}
