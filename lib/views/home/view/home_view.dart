import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/banner/cubit/banner_cubit.dart';
import 'package:ne_sever_mobile/bloc/category/cubit/category_cubit.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/image_slider.dart';
import 'package:ne_sever_mobile/core/widgets/custom_buttom_navigation_bar.dart';
import 'package:ne_sever_mobile/views/home/components/categories.dart';
import 'package:ne_sever_mobile/views/home/components/discount_banner.dart';
import 'package:ne_sever_mobile/views/home/components/home_header.dart';
import 'package:ne_sever_mobile/views/home/components/popular_product.dart';
import 'package:ne_sever_mobile/views/home/components/special_offers.dart';

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
          child: Column(
            children: [
              // SizedBox(height: getProportionateScreenHeight(20)),
              // HomeHeader(),
              // SizedBox(height: getProportionateScreenWidth(10)),
              // SizedBox(
              //   height: getProportionateScreenHeight(160),
              //   child: buildCategoriesRow(),
              // ),
              // DiscountBanner(),
              // SizedBox(height: getProportionateScreenWidth(10)),
              // PopularProducts(),
              // SizedBox(height: getProportionateScreenWidth(30)),
              // SpecialOffers(),
              // SizedBox(height: getProportionateScreenWidth(30)),

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
              SizedBox(child: buildBannerCategories()),
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
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: PopularProducts(),
                    ),
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }

  buildBannerCategories() {
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
