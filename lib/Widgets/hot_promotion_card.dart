import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Util/number_extention.dart';
import 'package:aviz/Widgets/chached_network_image.dart';
import 'package:flutter/material.dart';

class HotPromotionCard extends StatelessWidget {
  final Promotion promotion;
  HotPromotionCard(this.promotion, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 270,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            width: 192,
            height: 112,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: CachedImage(imageUrl: promotion.thumbnailUrl),
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: Text(
              promotion.title,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: Text(
              promotion.description,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                promotion.price.convertToPrice(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Spacer(),
              Text(
                ':قیمت',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
