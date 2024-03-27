import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Features/Home/data/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitialState()) {
    on<HomeGetInitlizeData>((event, emit) async {
      emit(HomeLaodingState());
      var hotPromotionList = await homeRepository.getHotPromotion();
      var latestPromotionList = await homeRepository.getLatesetPromotion();

      emit(HomeRequestSuccessState(
          hotPromotions: hotPromotionList,
          latestPromotions: latestPromotionList));
    });
  }
}
