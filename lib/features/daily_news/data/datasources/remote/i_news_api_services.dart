import '../../models/new_response.dart';

abstract class INewsApiServicesDataSource {
  Future<NewsApiResponseModel> getNewsArticles();
}
