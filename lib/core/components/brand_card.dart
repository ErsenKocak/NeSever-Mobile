import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/Brand.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;

  const BrandCard({Key key, @required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: SizedBox(
        child: GestureDetector(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ProductDetailView(
          //         trendWomanProduct: productList,
          //       ),
          //     )),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: brand.markaId,
                    child: imageFromBase64String(context, brand.resimBase64),
                  ),
                ),
              ),
              Text(
                brand.markaAdi,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  imageFromBase64String(BuildContext context, String base64Image) {
    final size = MediaQuery.of(context).size;

    final splittedBase64String = base64Image.split(",")[1];

    return Image.memory(
      base64Decode(splittedBase64String),
      fit: BoxFit.fill,
      height: size.height,
    );
  }
}