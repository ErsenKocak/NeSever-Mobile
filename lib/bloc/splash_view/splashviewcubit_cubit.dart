import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SplashViewCubit extends Cubit<int> {
  SplashViewCubit() : super(0);

  void getCurrentPageIndex(int currentPageIndex) {
    emit(currentPageIndex);
  }
}
