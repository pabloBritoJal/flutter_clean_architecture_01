import '../../domain/entities/article.dart';
import '../../domain/entities/news_api_response.dart';
import 'article.dart';

class NewsApiResponseModel extends NewsApiResponseEntity {
  NewsApiResponseModel({
    required super.articles,
  });

  factory NewsApiResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> articlesJson = json['articles'];
    final List<ArticleEntity> articles = articlesJson
        .map((articleJson) =>
            ArticleModel.fromJson(articleJson as Map<String, dynamic>))
        .toList();
    return NewsApiResponseModel(articles: articles);
  }
}
