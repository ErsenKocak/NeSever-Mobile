part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {
  CategoryInitialState();
}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState();
}

class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categoryList;

  CategoryLoadedState(this.categoryList);
}

class CategoryErrorState extends CategoryState {
  final String errorMessage;

  CategoryErrorState(this.errorMessage);
}
