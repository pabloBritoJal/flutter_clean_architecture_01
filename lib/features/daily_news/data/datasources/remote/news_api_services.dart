import 'dart:convert';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/client/simple_http.dart';
import '../../../../../core/api/interface/data_interface.dart';
import '../../../../../core/api/mixins/environment_api.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/tools/functions/api_success.dart';
import '../../models/new_response.dart';
import 'i_news_api_services.dart';

@Injectable(as: INewsApiServicesDataSource)
class NewsApiServicesDataSourse extends DataInterface
    with NewsApiEnvironmnet
    implements INewsApiServicesDataSource {
  final ISimpleHttp simpleHttp;

  NewsApiServicesDataSourse(this.simpleHttp);

  @override
  String get apiName => throw UnimplementedError();

  @override
  String get controller => throw UnimplementedError();

  @override
  Future<NewsApiResponseModel> getNewsArticles() async {
    final response = await simpleHttp.get(
      headers: headers(),
      url: url(),
    );

    return _apiCalls(response);
  }

  NewsApiResponseModel _apiCalls(response) {
    final isSuccess = isSuccessResponse(response);
    if (isSuccess) {
      final decodedJson = json.decode(response.body) as Map<String, dynamic>;
      {
        try {
          return NewsApiResponseModel.fromJson(decodedJson);
        } catch (e) {
          throw ParseException('Failed to parse API response: ${e.toString()}');
        }
      }
    } else {
      throw ConnectException('Failed to log in ${response.statusCode}');
    }
  }
}
