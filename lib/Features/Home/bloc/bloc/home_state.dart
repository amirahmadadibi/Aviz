part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<Promotion>> hotPromotions;

  HomeRequestSuccessState(this.hotPromotions);
}

class HomeLaodingState extends HomeState{
    
}
