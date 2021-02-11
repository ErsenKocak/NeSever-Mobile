import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ne_sever_mobile/bloc/product_detail/product_detail_cubit.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/image_manager.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/views/home/components/section_title.dart';
import 'package:ne_sever_mobile/views/product-detail/view/product_detail_view.dart';

class ProductWidget extends StatelessWidget {
  final List<Product> productList;
  final String sectionTitle;
  const ProductWidget(
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
            key: PageStorageKey('12'),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: productList
                .map((item) => ProductCard(
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
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            //  context
            //     .bloc<ProductDetailCubit>()
            //     .getProductDetail(product.urunId);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailView(
                    product: product,
                  ),
                ));

            //EasyLoading.show();
            // ignore: deprecated_member_use
          },
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
                    child: buildImages(context, product.resimUrl),
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
