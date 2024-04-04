import 'package:aviz/Constants/color_constants.dart';
import 'package:aviz/DI/di.dart';
import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Features/Search/bloc/bloc/search_bloc.dart';
import 'package:aviz/Widgets/aviz_custom_textfiled.dart';
import 'package:aviz/Widgets/normal_promotion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(locator.get()),
      child: ViewContainer(
        searchInputController: searchInputController,
      ),
    );
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
    required this.searchInputController,
  });

  final TextEditingController searchInputController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: ((context, state) {
      return SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: AvizTextFiled(
                    controller: searchInputController,
                    hintText: '...جستجو',
                    onchanged: (value) {},
                    onSubmitted: (value) {
                      context
                          .read<SearchBloc>()
                          .add(SearchWithQueryData(query: value));
                    },
                    keyboardType: TextInputType.text,
                    textinputAction: TextInputAction.search,
                    suffixIcon: Image.asset(
                      'assets/images/inactive_search_icon.png',
                      color: CustomColor.gery,
                    ),
                    defaultFillColor: Colors.white,
                    changeFillColor: true,
                  ),
                ),
              ),
              if (state is SearchLaodingState) ...{
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
              if (state is SearchRequestSuccessState) ...{
                state.searchResult.fold((l) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(l),
                    ),
                  );
                }, (r) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return NormalPromotionCard(r[index]);
                    }, childCount: r.length),
                  );
                })
              },
            ],
          ),
        ),
      );
    }));
  }
}
