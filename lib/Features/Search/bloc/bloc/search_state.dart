part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}

class SearchRequestSuccessState extends SearchState {
  Either<String, List<Promotion>> searchResult;

  SearchRequestSuccessState({required this.searchResult});
}

class SearchLaodingState extends SearchState {}
