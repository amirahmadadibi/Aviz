import 'package:aviz/DI/di.dart';
import 'package:aviz/Features/Home/data/datasource/home_datasource.dart';
import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/NetworkUtil/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<String, List<Promotion>>> getHotPromotion();
    Future<Either<String, List<Promotion>>> getLatesetPromotion();

}

class HomeRepository extends IHomeRepository {
  final IHomeDatasource datasource;

  HomeRepository(this.datasource);

  @override
  Future<Either<String, List<Promotion>>> getHotPromotion() async {
    try {
      var response = await datasource.getHotPromotions();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
  
  @override
  Future<Either<String, List<Promotion>>> getLatesetPromotion() async {
     try {
      var response = await datasource.getLatestPromotions();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
