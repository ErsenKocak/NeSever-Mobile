// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RouterViewModel on _RouterViewModelBase, Store {
  final _$pageListAtom = Atom(name: '_RouterViewModelBase.pageList');

  @override
  List<Widget> get pageList {
    _$pageListAtom.reportRead();
    return super.pageList;
  }

  @override
  set pageList(List<Widget> value) {
    _$pageListAtom.reportWrite(value, super.pageList, () {
      super.pageList = value;
    });
  }

  final _$currentViewIndexAtom =
      Atom(name: '_RouterViewModelBase.currentViewIndex');

  @override
  int get currentViewIndex {
    _$currentViewIndexAtom.reportRead();
    return super.currentViewIndex;
  }

  @override
  set currentViewIndex(int value) {
    _$currentViewIndexAtom.reportWrite(value, super.currentViewIndex, () {
      super.currentViewIndex = value;
    });
  }

  final _$_RouterViewModelBaseActionController =
      ActionController(name: '_RouterViewModelBase');

  @override
  void changePageIndex(BuildContext context, int index) {
    final _$actionInfo = _$_RouterViewModelBaseActionController.startAction(
        name: '_RouterViewModelBase.changePageIndex');
    try {
      return super.changePageIndex(context, index);
    } finally {
      _$_RouterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageList: ${pageList},
currentViewIndex: ${currentViewIndex}
    ''';
  }
}
