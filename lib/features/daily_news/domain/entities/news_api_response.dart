import 'package:flutter_clean_architecture_01/features/daily_news/domain/entities/article.dart';

class NewsApiResponseEntity {
  final List<ArticleEntity> articles;

  const NewsApiResponseEntity({required this.articles});
}
