import 'package:flutter/material.dart';

class NormalPromotionCardRaw extends StatelessWidget {
  const NormalPromotionCardRaw({super.key});

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
              image: DecorationImage(
                  image: AssetImage('assets/images/product_image_2.png')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: Text(
                    'واحد دوبلکس فول امکانات',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 16,
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF98A2B3),
                      fontSize: 14,
                      fontFamily: 'Shabnam',
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
                      '۸٬۲۰۰٬۰۰۰٬۰۰۰',
                      style: TextStyle(
                        color: Color(0xFFE60023),
                        fontSize: 15,
                        fontFamily: 'Shabnam',
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
                        fontFamily: 'Shabnam',
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
