import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cycle8_sat/shared_component/network/api_manager.dart';

import '../../model/articl_model.dart';

class NewsListViewModel extends Cubit<NewsListViewState> {
  NewsListViewModel() : super(LoadingState(loadingMessage: "Loading........."));

  void loadArticls(String sourceId) async {
    try {
      var response = await ApiManager.fetchNewsList(sourceId);

      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.meesage));
        return;
      }
      if (response.status == "ok") {
        emit(SuccessState(response.articles!));
        return;
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(
          errorMessage: "couldn't reach to server "
              "please check your internet connection"));
    } on Exception catch (e) {
      emit(ErrorState(errorMessage: "please try again..."));
    }
  }
}

abstract class NewsListViewState {}

class LoadingState extends NewsListViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsListViewState {
  List<Articles> articls;

  SuccessState(this.articls);
}
