import 'dart:convert';
import 'package:flutter/material.dart';

buildImages(BuildContext context, String imageStrings) {
  if (imageStrings.contains('https')) {
    return Image.network(imageStrings);
  } else if (imageStrings.contains('/Uploads/')) {
    return Image.network("https://www.nesever.com.tr" + imageStrings);
  } else {
    final size = MediaQuery.of(context).size;
    final splittedBase64String = imageStrings.split(",")[1];

    return Image.memory(
      base64Decode(splittedBase64String),
      fit: BoxFit.fill,
      height: size.height,
    );
  }
}
