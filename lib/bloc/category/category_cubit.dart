import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Category.dart';
import 'package:ne_sever_mobile/repository/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final _categoryRepository = locator<CategoryRepository>();

  CategoryCubit() : super(CategoryInitialState());

  void getCategories() async {
    try {
      emit(CategoryLoadingState());
      final response = await _categoryRepository.getCategories();
      emit(CategoryLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(CategoryErrorState(e.errorMessage));
    }
  }
}

class SubCategoryCubit extends Cubit<List<CategoryModel>> {
  SubCategoryCubit() : super([]);

  void getSubCategories(
      CategoryModel selectedCategory, List<CategoryModel> categoryList) {
    try {
      final subCategoryList = List<CategoryModel>();

      categoryList.forEach((item) => {
            if (selectedCategory.kategoriId == item.ustKategoriId)
              {subCategoryList.add(item)}
          });

      emit(subCategoryList);
    } catch (e) {
      print(e);
    }
  }
}
