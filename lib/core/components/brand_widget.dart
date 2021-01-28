import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/brand_card.dart';
import 'package:ne_sever_mobile/models/Brand.dart';
import 'package:ne_sever_mobile/models/Product.dart';

import 'package:ne_sever_mobile/views/home/components/section_title.dart';
import 'package:ne_sever_mobile/views/product-detail/view/product_detail_view.dart';

class BrandWidget extends StatelessWidget {
  final List<Brand> brandList;
  final String sectionTitle;
  const BrandWidget(
      {Key key, @required this.brandList, @required this.sectionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: sectionTitle, press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            brandList.length,
            (index) {
              return BrandCard(
                brand: brandList[index],
              );

              // here by default width and height is 0
            },
          ),
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: SizedBox(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailView(
                  product: product,
                ),
              )),
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
                    tag: product.urunId.toString(),
                    child: Image.network(product.resimUrl),
                  ),
                ),
              ),
              Text(
                product.urunAdi,
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
