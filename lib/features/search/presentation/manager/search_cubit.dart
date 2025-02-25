import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';
import 'package:life/features/search/data/repositories/search_repo.dart';
import 'package:life/features/search/presentation/manager/search_state.dart';

class SearchBloc extends Cubit<SearchState> {
  SearchBloc({required this.searchRepo}) : super(SearchInitState());

  final SearchRepo searchRepo;
  TextEditingController searchController = TextEditingController();

  List<NurseDataModel> searchList = [];

  Future<void> onSearchChanged(
      {required String name, required int page}) async {
    emit(SearchLoadingState());
    final result = await searchRepo.search(query: name, page: page);
    result.fold(
      (failure) {
        emit(SearchFailureState(message: failure.message));
      },
      (nurse) {
        searchList.addAll(nurse);
        emit(SearchSuccessState());
      },
    );
  }

  ScrollController scrollController = ScrollController();
  VoidCallback? _scrollListener;

  void getMoreNurses() async {
    int count=2;
    if (_scrollListener != null) {
      scrollController.removeListener(_scrollListener!);
    }
    _scrollListener = () {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onSearchChanged(name: searchController.text, page: count++);

      }
    };
    scrollController.addListener(_scrollListener!);
  }


  void getMoreSearchedNurses(ScrollController scrollController) async {
    int count=2;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onSearchChanged(name: searchController.text, page: count++);
      }
    });
  }

  @override
  void emit(SearchState state){
    if(!isClosed) {
      super.emit(state);
    }
  }



}
