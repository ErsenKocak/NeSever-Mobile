import 'package:bloc/bloc.dart';

class SplashViewCubit extends Cubit<int> {
  SplashViewCubit() : super(0);

  void getCurrentPageIndex(int currentPageIndex) {
    emit(currentPageIndex);
  }
}
