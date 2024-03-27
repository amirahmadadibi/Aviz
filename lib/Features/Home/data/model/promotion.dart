import 'package:aviz/Constants/string_constants.dart';

class Promotion {
  String id;
  String title;
  String description;
  String thumbnailUrl;
  int price;

  Promotion(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl,
      required this.price});

  factory Promotion.fromJson(Map<String, dynamic> jsonObject) {
    return Promotion(
        id: jsonObject['id'],
        title: jsonObject['name'],
        description: jsonObject['description'],
        thumbnailUrl:
            '${StringConstants.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
        price: jsonObject['price']);
  }
}
