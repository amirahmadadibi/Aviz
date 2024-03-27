import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Util/number_extention.dart';
import 'package:aviz/Widgets/chached_network_image.dart';
import 'package:flutter/material.dart';

class NormalPromotionCard extends StatelessWidget {
  final Promotion promotion;
  NormalPromotionCard(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 148,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [
          BoxShadow(
            color: Color.fromARGB(255, 218, 218, 218),
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0,
              10,
            ),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
            child: CachedImage(imageUrl: promotion.thumbnailUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: Text(
                    promotion.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 16,
                      fontFamily: 'dana',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    promotion.description,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF98A2B3),
                      fontSize: 14,
                      fontFamily: 'dana',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      promotion.price.convertToPrice(),
                      style: TextStyle(
                        color: Color(0xFFE60023),
                        fontSize: 15,
                        fontFamily: 'dana',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      ':قیمت',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF101828),
                        fontSize: 15,
                        fontFamily: 'dana',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
