import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/general_messages.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/entities/news_api_response.dart';
import '../../domain/i_repository/i_article_repository.dart';
import '../datasources/remote/i_news_api_services.dart';

@Injectable(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final INewsApiServicesDataSource newsApiServicesDataSourse;

  final IConnectionChecker connectionChecker;

  ArticleRepository(this.newsApiServicesDataSourse, this.connectionChecker);

  @override
  Future<Either<ConnectException, NewsApiResponseEntity>>
      getNewsArticles() async {
    if (!await (connectionChecker.isConnected)) {
      return Left(ConnectException(noConnectionErrorMessage));
    }
    try {
      final result = await newsApiServicesDataSourse.getNewsArticles();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ConnectException(e.message));
    }
  }
}
