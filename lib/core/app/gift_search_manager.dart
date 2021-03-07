import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';

ProductSearch buildGiftSearch(String parameter) {
  print(parameter);
  ProductSearch productSearch = ProductSearch();

  var splitted1;
  var splitted2;
  var splitted3;

  if (parameter.contains("?")) {
    splitted1 = parameter.split("?");
    splitted2 = splitted1[1].split("&");
  } else {
    splitted1 = parameter;
    splitted2 = splitted1.split("&");
  }
  var parameterHashMap = Map<String, String>();
  for (int i = 0; i < splitted2.length; i++) {
    parameterHashMap[splitted2[i].split("=")[0]] = splitted2[i].split("=")[1];
  }

  parameterHashMap.forEach((k, v) => {
        if (v.contains("%20"))
          {
            splitted3 = v.split('%20')[0] + " " + v.split('%20')[1],
            v = splitted3
          },
        if (k == "s")
          {productSearch.siralama = v}
        else if (k == "q")
          {
            productSearch.aramaKelime = v,
          }
        else if (k == "m")
          {
            productSearch.aramaMarka = v,
          }
        else if (k == "k")
          {productSearch.aramaKategori = v}
        else if (k == "w")
          {productSearch.aramaSite = v},
        productSearch.length = 20
      });

  print('GİFT SEARCH -->' + parameterHashMap.toString());
  return productSearch;
}
