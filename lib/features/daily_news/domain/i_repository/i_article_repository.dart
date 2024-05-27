import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_01/core/error/exception.dart';
import 'package:flutter_clean_architecture_01/features/daily_news/domain/entities/news_api_response.dart';

abstract class IArticleRepository {
  Future<Either<ConnectException, NewsApiResponseEntity>> getNewsArticles();
}
