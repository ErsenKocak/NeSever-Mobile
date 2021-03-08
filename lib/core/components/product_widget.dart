import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/image_manager.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/views/home/components/section_title.dart';
import 'package:ne_sever_mobile/views/product-detail/view/product_detail_view.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductWidget extends StatelessWidget {
  final List<Product> productList;
  final String sectionTitle;

  ProductWidget(
      {Key key, @required this.productList, @required this.sectionTitle})
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
            key: PageStorageKey(productList[0].urunId),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            children: productList
                .map((item) => ProductCard(
                      key: PageStorageKey(item.urunId.toString()),
                      product: item,
                    ))
                .toList()

            // List.generate(
            //   productList.length,
            //   (index) {
            //     return ProductCard(
            //       product: productList[index],
            //     );

            //     // here by default width and height is 0
            //   },
            // ),
            ),
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
      child: GestureDetector(
        onTap: () {
          //  context
          //     .bloc<ProductDetailCubit>()
          //     .getProductDetail(product.urunId);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailView(
                  key: PageStorageKey(product.urunId.toString()),
                  product: product,
                ),
              ));

          //EasyLoading.show();
          // ignore: deprecated_member_use
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AspectRatio(
            //   aspectRatio: 2,
            //   child: Container(
            //     padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            //     decoration: BoxDecoration(
            //       color: kSecondaryColor.withOpacity(0.1),
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: buildImages(context, product.resimUrl),
            //   ),
            // ),

            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(1)),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: buildImages(context, product.resimUrl),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child:
            //       // Text(
            //       //   product.urunAdi,
            //       //   style: TextStyle(fontSize: 12, color: Colors.black),
            //       // ),

            // ),
            AutoSizeText(
              product.urunAdi,
              style: TextStyle(fontSize: 14, color: Colors.black),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
