import 'package:aviz/Features/Home/data/model/promotion.dart';
import 'package:aviz/NetworkUtil/api_exception.dart';
import 'package:dio/dio.dart';

abstract class ISearchDatasource {
  Future<List<Promotion>> getSearchResult(String query);
}

class SerachRemoteDatasource extends ISearchDatasource {
  final Dio _dio;

  SerachRemoteDatasource(this._dio);

  @override
  Future<List<Promotion>> getSearchResult(String query) async {
    try {
      Map<String, dynamic> promotionQuery = {'filter': 'is_hot=true'};
      var response = await _dio.get('collections/promotion/records',
          queryParameters: promotionQuery);
      return response.data['items']
          .map<Promotion>((jsonObject) => Promotion.fromJson(jsonObject))
          .toList();
    } on DioException catch (dioException) {
      throw ApiException(
          dioException.response?.statusCode ?? 0, dioException.message);
    } catch (ex) {
      throw ApiException(0, 'unknwon');
    }
  }
}
