import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/Features/Search/data/datasource/serach_datasource.dart';
import 'package:aviz/NetworkUtil/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<String, List<Promotion>>> search(String query);
}

class SearchRepository extends ISearchRepository {
  final ISearchDatasource datasource;

  SearchRepository(this.datasource);
  
  @override
  Future<Either<String, List<Promotion>>> search(String query) async {
    try {
      var response = await datasource.getSearchResult(query);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
