import 'package:flutter/material.dart';

class HotPromoionCardRaw extends StatelessWidget {
  const HotPromoionCardRaw({super.key});
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
              image: DecorationImage(
                image: AssetImage('assets/images/product_image_1.png'),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: Text(
              'ویلا ۵۰۰ متری زیر قیمت',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF101828),
                fontSize: 16,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: Text(
              'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF98A2B3),
                fontSize: 14,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                '۲۵٬۶۸۳٬۰۰۰٬۰۰۰',
                style: TextStyle(
                  color: Color(0xFFE60023),
                  fontSize: 15,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              const Text(
                ':قیمت',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xffE60023),
                  fontSize: 15,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
