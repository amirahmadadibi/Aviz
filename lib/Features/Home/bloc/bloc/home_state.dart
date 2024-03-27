part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<Promotion>> hotPromotions;
  Either<String, List<Promotion>> latestPromotions;

  HomeRequestSuccessState(
      {required this.hotPromotions, required this.latestPromotions});
}

class HomeLaodingState extends HomeState {}
