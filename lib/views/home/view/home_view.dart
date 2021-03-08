import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/bloc/brand/brand_cubit.dart';
import 'package:ne_sever_mobile/core/components/brand_widget.dart';
import 'package:ne_sever_mobile/core/components/loading_bar_manager.dart';
import 'package:ne_sever_mobile/core/components/product_widget.dart';
import '../../../bloc/banner/cubit/banner_cubit.dart';
import '../../../bloc/banner_category/categorybanner_cubit.dart';
import '../../../bloc/category/category_cubit.dart';
import '../../../bloc/trend_man_product/trend_man_product_cubit.dart';
import '../../../bloc/trend_woman_product/trend_woman_product_cubit.dart';
import '../../../core/app/size_config.dart';
import '../../../core/components/image_slider.dart';
import '../components/banner_category_widget.dart';
import '../components/categories.dart';
import '../components/discount_banner.dart';
import '../components/home_header.dart';
import '../components/special_offers.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    showLoadingBar();
    networkListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          key: PageStorageKey('scroll'),
          child: GestureDetector(
            onPanDown: (detail) {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: HomeHeader(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  // SizedBox(
                  //   height: getProportionateScreenHeight(160),
                  //   child: buildCategoriesRow(),
                  // ),
                  SizedBox(child: buildBanners()),
                  // SizedBox(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: DiscountBanner(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  // SizedBox(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: PopularProducts(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  // SizedBox(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: SpecialOffers(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  SizedBox(
                      child: Column(
                    children: [buildCategoryBanners()],
                  )),
                  SizedBox(
                      child: Column(
                    children: [buildTrendWomanProducts()],
                  )),
                  SizedBox(
                      child: Column(
                    children: [buildTrendManProducts()],
                  )),
                  SizedBox(
                      child: Column(
                    children: [buildBrands()],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildBrands() {
    return BlocConsumer<BrandCubit, BrandState>(
      key: PageStorageKey('1'),
      listener: (context, state) {
        if (state is BrandErrorState) {
          print('BRAND ERROR LİSTENER');
          dismissLoadingBar();
          return SizedBox();
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is BrandInitial) {
          // ignore: deprecated_member_use
          context.bloc<BrandCubit>().getBrands();
          return Center(
            child: SizedBox(),
          );
        } else if (state is BrandLoadedState) {
          dismissLoadingBar();
          if (state.brandList != null) {
            return BrandWidget(
              brandList: state.brandList,
              sectionTitle: "Marka",
            );
          } else {
            return SizedBox();
          }
        }
      },
    );
  }

  buildTrendManProducts() {
    return BlocConsumer<TrendManProductCubit, TrendManProductState>(
      key: PageStorageKey('2'),
      listener: (context, state) {
        if (state is TrendManProductErrorState) {
          dismissLoadingBar();
          return SizedBox();
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is TrendManProductInitial) {
          // ignore: deprecated_member_use
          context.bloc<TrendManProductCubit>().getTrendManProducts();
          return Center(
            child: SizedBox(),
          );
        } else if (state is TrendManProductLoadedState) {
          if (state.trendManProductList != null) {
            return ProductWidget(
              productList: state.trendManProductList,
              sectionTitle: "Trend Erkek Hediyeleri",
            );
          } else {
            return SizedBox();
          }
        }
      },
    );
  }

  buildTrendWomanProducts() {
    return BlocConsumer<TrendWomanProductCubit, TrendWomanProductState>(
      key: PageStorageKey('3'),
      listener: (context, state) {
        if (state is TrendWomanProductErrorState) {
          dismissLoadingBar();
          return SizedBox();
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is TrendWomanProductInitial) {
          // ignore: deprecated_member_use
          context.bloc<TrendWomanProductCubit>().getTrendWomanProducts();
          return Center(
            child: SizedBox(),
          );
        } else if (state is TrendWomanProductLoadedState) {
          if (state.trendWomanProductList != null) {
            return ProductWidget(
              productList: state.trendWomanProductList,
              sectionTitle: "Trend Kadın Hediyeleri",
            );
          } else {
            return SizedBox();
          }
        }
      },
    );
  }

  buildCategoryBanners() {
    return BlocConsumer<CategorybannerCubit, CategoryBannerState>(
      key: PageStorageKey('4'),
      listener: (context, state) {
        if (state is CategoryBannerErrorState) {
          dismissLoadingBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          return SizedBox();
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is CategoryBannerInitial) {
          // ignore: deprecated_member_use
          context.bloc<CategorybannerCubit>().getCategoryBanners();
          return Center(
            child: SizedBox(),
          );
        } else if (state is CategoryBannerLoadedState) {
          if (state.bannerCategoryList != null) {
            return CategoryBannerWidget(
              bannerCategoryList: state.bannerCategoryList,
            );
          } else {
            return SizedBox();
          }
        } else if (state is CategoryBannerErrorState) {
          dismissLoadingBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return SizedBox();
        }
      },
    );
  }

  buildBanners() {
    return BlocConsumer<BannerCubit, BannerState>(
      key: PageStorageKey('5'),
      listener: (context, state) {
        if (state is BannerErrorState) {
          dismissLoadingBar();
          return SizedBox();
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is BannerInitial) {
          // ignore: deprecated_member_use

          context.bloc<BannerCubit>().getBanners();
          return Center(
            child: Text(''),
          );
        } else if (state is BannerLoadedState) {
          if (state.bannerCategoryList != null) {
            return ImageSliderWidget(
              bannerCategoryList: state.bannerCategoryList,
            );
          } else {
            print('BRAND BLOC LOADED ELSE');
            return SizedBox();
          }
        }
      },
    );
  }

  buildCategoriesRow() {
    return Row(
      children: [
        BlocConsumer<CategoryCubit, CategoryState>(
          key: PageStorageKey('6'),
          listener: (context, state) {
            if (state is CategoryErrorState) {
              dismissLoadingBar();
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          // ignore: missing_return
          builder: (context, state) {
            if (state is CategoryInitialState) {
              // ignore: deprecated_member_use
              context.bloc<CategoryCubit>().getCategories();
              return Center(
                child: Text(''),
              );
            } else if (state is CategoryLoadedState) {
              dismissLoadingBar();
              if (state.categoryList != null) {
                return categoriesRowWidget(state);
              } else {
                return SizedBox();
              }
            }
          },
        ),
      ],
    );
  }

  categoriesRowWidget(CategoryLoadedState state) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        key: PageStorageKey('10'),
        scrollDirection: Axis.horizontal,
        itemCount: state.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          if (state.categoryList[index].ustKategoriId == null) {
            return Padding(
              padding: EdgeInsets.all(2),
              child: CategoryCard(
                category: state.categoryList[index],
                icon: 'assets/icons/book.svg',
                text: state.categoryList[index].kategoriAdi,
                press: () {
                  // print(categories[index].categoryText);
                },
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  showMySnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  networkListener() {
    DataConnectionChecker().onStatusChange.listen((event) {
      Logger().w(event);
      showMySnackBar(event.toString());
    });
  }
}
