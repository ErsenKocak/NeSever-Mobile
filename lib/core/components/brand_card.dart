import 'package:flutter/material.dart';
import '../app/constants.dart';
import '../app/image_manager.dart';
import '../app/size_config.dart';
import '../../models/Brand.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;
  final VoidCallback onPress;
  const BrandCard({Key key, @required this.brand, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: SizedBox(
        child: InkWell(
          onTap: onPress,
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
                    child: buildImages(context, brand.resimBase64),
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
}
