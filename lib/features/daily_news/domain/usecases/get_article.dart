import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/news_api_response.dart';
import '../i_repository/i_article_repository.dart';

@injectable
class GetArticleUseCase implements UseCase<NewsApiResponseEntity, NoParams> {
  final IArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<Either<ConnectException, NewsApiResponseEntity>> call(
      NoParams params) async {
    return await _articleRepository.getNewsArticles();
  }
}
