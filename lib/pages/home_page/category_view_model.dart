// Business Logic

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cycle8_sat/shared_component/network/api_manager.dart';
import '../../model/source_model.dart';

class CategoryViewModel extends Cubit<CategoryViewState> {
  CategoryViewModel() : super(LoadingState());

  void loadNewsSourcse(String category) async {
    try {
      var response = await ApiManager.fetchSources(category);
      if (response.status == "error") {
        // show error
        emit(ErrorState(errorMessage: response.message));
      }
      if (response.status == "ok") {
        emit(SuccessState(response.sources!));
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(
          errorMessage: "couldn't reach to server "
              "please check your internet connection"));
    } on Exception catch (e) {
      emit(ErrorState(errorMessage: "please try again"));
    }
  }
}

// Loading - Error - Success

abstract class CategoryViewState {}

class LoadingState extends CategoryViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends CategoryViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends CategoryViewState {
  List<Sources> sources;

  SuccessState(this.sources);
}
