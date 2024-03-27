import 'package:aviz/source/home_source/hot_promotion_raw.dart';
import 'package:aviz/source/home_source/promotion_raw.dart';
import 'package:flutter/material.dart';

class HomeAvizScreenRaw extends StatefulWidget {
  const HomeAvizScreenRaw({super.key});

  @override
  State<HomeAvizScreenRaw> createState() => _HomeAvizScreenRawState();
}

class _HomeAvizScreenRawState extends State<HomeAvizScreenRaw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Image.asset("assets/images/logo_with_not_background.png"),
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
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD0D5DD)),
                    ),
                    Spacer(),
                    Text(
                      'آویز های داغ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
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
                        child: HotPromoionCardRaw(),
                        //   onTap: () => Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => AvizDetailScreen(),
                        //       )),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  children: [
                    Text(
                      'مشاهده همه',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD0D5DD)),
                    ),
                    Spacer(),
                    Text(
                      'آویز های اخیر',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    child: NormalPromotionCardRaw(),
                    //   onTap: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => AvizDetailScreen(),
                    //       )),
                  ),
                ),
                childCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
