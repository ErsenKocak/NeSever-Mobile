import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/views/product_search/product_search_view.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  String searchingWord;
  SearchField({Key key, @required this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => searchingWord = value,
        onSubmitted: (value) => productSearchSubmitted(context),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => productSearchSubmitted(context),
          ),
        ),
      ),
    );
  }

  productSearchSubmitted(BuildContext context) {
    print('SEARCHING WORD --> ');
    print(searchingWord);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductSearchView(
            searchingWord: searchingWord,
          ),
        ));
  }
}
