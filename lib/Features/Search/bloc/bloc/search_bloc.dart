import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Features/Search/data/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc(this.searchRepository) : super(SearchInitialState()) {
    on<SearchWithQueryData>((event, emit) async {
      emit(SearchLaodingState());
      final result = await searchRepository.search(event.query);
     emit(SearchRequestSuccessState(searchResult: result));
    });
  }
}
