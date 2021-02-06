import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/brand/brand_cubit.dart';
import 'package:ne_sever_mobile/core/components/brand_widget.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(
                  height: getProportionateScreenHeight(160),
                  child: buildCategoriesRow(),
                ),
                SizedBox(child: buildBanners()),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: DiscountBanner(),
                      ),
                    ],
                  ),
                ),
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
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: SpecialOffers(),
                      ),
                    ],
                  ),
                ),
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
    );
  }

  buildBrands() {
    return BlocConsumer<BrandCubit, BrandState>(
      listener: (context, state) {
        if (state is BrandErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is BrandInitial) {
          context.bloc<BrandCubit>().getBrands();
          return Center(
            child: SizedBox(),
          );
        } else if (state is BrandLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BrandLoadedState) {
          //Logger().w(state.brandList);

          return BrandWidget(
            brandList: state.brandList,
            sectionTitle: "Marka",
          );
        } else if (state is BrandErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }

  buildTrendManProducts() {
    return BlocConsumer<TrendManProductCubit, TrendManProductState>(
      listener: (context, state) {
        if (state is TrendManProductErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is TrendManProductInitial) {
          context.bloc<TrendManProductCubit>().getTrendManProducts();
          return Center(
            child: SizedBox(),
          );
        } else if (state is TrendManProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrendManProductLoadedState) {
          return ProductWidget(
            productList: state.trendManProductList,
            sectionTitle: "Trend Erkek Hediyeleri",
          );
        } else if (state is TrendManProductErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }

  buildTrendWomanProducts() {
    return BlocConsumer<TrendWomanProductCubit, TrendWomanProductState>(
      listener: (context, state) {
        if (state is TrendWomanProductErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is TrendWomanProductInitial) {
          context.bloc<TrendWomanProductCubit>().getTrendWomanProducts();
          return Center(
            child: SizedBox(),
          );
        } else if (state is TrendWomanProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrendWomanProductLoadedState) {
          return ProductWidget(
            productList: state.trendWomanProductList,
            sectionTitle: "Trend Kadın Hediyeleri",
          );
        } else if (state is TrendWomanProductErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }

  buildCategoryBanners() {
    return BlocConsumer<CategorybannerCubit, CategoryBannerState>(
      listener: (context, state) {
        if (state is CategoryBannerErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is CategoryBannerInitial) {
          context.bloc<CategorybannerCubit>().getCategoryBanners();
          return Center(
            child: SizedBox(),
          );
        } else if (state is CategoryBannerLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryBannerLoadedState) {
          return CategoryBannerWidget(
            bannerCategoryList: state.bannerCategoryList,
          );
        } else if (state is CategoryBannerErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }

  buildBanners() {
    return BlocConsumer<BannerCubit, BannerState>(
      listener: (context, state) {
        if (state is BannerErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is BannerInitial) {
          context.bloc<BannerCubit>().getBanners();
          return Center(
            child: SizedBox(),
          );
        } else if (state is BannerLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BannerLoadedState) {
          return ImageSliderWidget(
            bannerCategoryList: state.bannerCategoryList,
          );
        } else if (state is BannerErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }

  Row buildCategoriesRow() {
    return Row(
      children: [
        BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
            if (state is CategoryErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          // ignore: missing_return
          builder: (context, state) {
            if (state is CategoryInitialState) {
              context.bloc<CategoryCubit>().getCategories();
              return Center(
                child: Text(''),
              );
            } else if (state is CategoryLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryLoadedState) {
              return Expanded(
                flex: 2,
                child: ListView.builder(
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
          },
        ),
      ],
    );
  }
}
