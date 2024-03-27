import 'package:aviz/DI/di.dart';
import 'package:aviz/Features/Home/bloc/bloc/home_bloc.dart';
import 'package:aviz/Widgets/hot_promotion_card.dart';
import 'package:aviz/Widgets/normal_promotion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        HomeBloc homeBloc = HomeBloc(locator.get());
        homeBloc.add(HomeGetInitlizeData());
        return homeBloc;
      }),
      child: ViewContainer(),
    );
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title:
                    Image.asset("assets/images/logo_with_not_background.png"),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'مشاهده همه',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'dana',
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD0D5DD)),
                      ),
                      Spacer(),
                      Text(
                        'آویز های داغ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'dana',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is HomeLaodingState) ...{
                const SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              },
              if (state is HomeRequestSuccessState) ...{
                state.hotPromotions.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (promotionList) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: GestureDetector(
                              child: HotPromotionCard(promotionList[index]),
                            ),
                          );
                        },
                        itemCount: promotionList.length,
                      ),
                    ),
                  );
                })
              },
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    children: [
                      Text(
                        'مشاهده همه',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'dana',
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD0D5DD)),
                      ),
                      Spacer(),
                      Text(
                        'آویز های اخیر',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'dana',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is HomeLaodingState) ...{
                const SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              },
              if (state is HomeRequestSuccessState) ...{
                state.latestPromotions.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (latestPromotions) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          child: NormalPromotionCard(latestPromotions[index]),
                        ),
                      ),
                      childCount: latestPromotions.length,
                    ),
                  );
                })
              }
            ],
          ),
        ),
      );
    }));
  }
}
