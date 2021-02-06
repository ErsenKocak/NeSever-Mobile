import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/image_manager.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/models/ProductDetail.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required this.productDetail,
    this.product,
  }) : super(key: key);

  final ProductDetail productDetail;
  final Product product;
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
                tag: widget.product.urunId.toString(),
                child: buildImages(
                    context, widget.productDetail.resimler[selectedImage])),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.productDetail.resimler.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
          duration: defaultDuration,
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.all(8),
          height: getProportionateScreenWidth(48),
          width: getProportionateScreenWidth(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
          ),
          child: buildImages(context, widget.productDetail.resimler[index])),
    );
  }
}
