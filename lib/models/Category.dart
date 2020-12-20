import 'package:flutter/material.dart';

class Category {
  final String iconUrl;
  final String categoryText;
  bool isActive;

  Category(
      {@required this.iconUrl,
      @required this.categoryText,
      @required this.isActive});
}

List<Category> categories = [
  Category(
      iconUrl: "assets/icons/Flash Icon.svg",
      categoryText: "Flash Gönderi",
      isActive: false),
  Category(
      iconUrl: "assets/icons/Bill Icon.svg",
      categoryText: "Kart",
      isActive: false),
  Category(
      iconUrl: "assets/icons/Game Icon.svg",
      categoryText: "Oyunlar",
      isActive: false),
  Category(
      iconUrl: "assets/icons/Gift Icon.svg",
      categoryText: "Günlük Kullanım",
      isActive: false),
  Category(
      iconUrl: "assets/icons/book.svg",
      categoryText: "Kitaplar",
      isActive: false),
];
