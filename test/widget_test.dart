// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';

import 'mock/model/category_mock_model.dart';
import 'mock/service/category_mock_service.dart';

void main() {
  setupLocator();
  test('Category Test', () async {
    final _categoryMockService = CategoryMockService();
    List<CategoryMockModel> categoryList =
        await _categoryMockService.getCategories();
    Logger().i(categoryList[0].kategoriAdi);
    expect(categoryList.length > 0, true);
  });
}
