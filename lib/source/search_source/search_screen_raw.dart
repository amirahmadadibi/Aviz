import 'package:aviz/Constants/color_constants.dart';
import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Widgets/aviz_custom_textfiled.dart';
import 'package:aviz/Widgets/normal_promotion_card.dart';
import 'package:flutter/material.dart';

class SearchScreenRaw extends StatefulWidget {
  SearchScreenRaw({super.key});

  @override
  State<SearchScreenRaw> createState() => _SearchScreenRawState();
}

class _SearchScreenRawState extends State<SearchScreenRaw> {
  TextEditingController searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    print('User entered: $value');
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          child: NormalPromotionCard(
                            Promotion(
                                description: 'asdfasdf',
                                price: 11111111,
                                id: 'sdfsdfsdf',
                                title: 'asdfasdfasdf',
                                thumbnailUrl:
                                    'https://postimage01.divarcdn.com/static/photo/afra/web_thumbnail/KSx3sf7Tz2p04jbPDtTpwA/8a64e1d7-da37-45b9-98c0-3b02d9ed3b27.webp'),
                          ),
                        ),
                      ),
                  childCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
