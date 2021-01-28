import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/Product.dart';

import 'package:ne_sever_mobile/views/home/components/section_title.dart';
import 'package:ne_sever_mobile/views/product-detail/view/product_detail_view.dart';

class ProductWidget extends StatelessWidget {
  final List<Product> trendWomanProductList;

  const ProductWidget({Key key, @required this.trendWomanProductList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Trend Kadın Hediyeleri", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            trendWomanProductList.length,
            (index) {
              return ProductCard(
                trendWomanProduct: trendWomanProductList[index],
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
  final Product trendWomanProduct;

  const ProductCard({Key key, @required this.trendWomanProduct})
      : super(key: key);

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
                  trendWomanProduct: trendWomanProduct,
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
                    tag: trendWomanProduct.urunId.toString(),
                    child: Image.network(trendWomanProduct.resimUrl),
                  ),
                ),
              ),
              Text(
                trendWomanProduct.urunAdi,
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
