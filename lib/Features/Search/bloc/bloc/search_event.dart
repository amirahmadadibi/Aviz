part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchWithQueryData extends SearchEvent {
  final String query;
  SearchWithQueryData({required this.query});
}
