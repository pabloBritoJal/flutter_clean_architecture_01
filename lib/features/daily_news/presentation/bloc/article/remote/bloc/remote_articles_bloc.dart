import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_01/features/daily_news/domain/entities/news_api_response.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clean_architecture_01/features/daily_news/domain/usecases/get_article.dart';
import '../../../../../../../core/usecases/i_usecase.dart';
import '../../../../../domain/entities/article.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

@injectable
class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(_onGetArticles);
  }

  void _onGetArticles(
    GetArticles event,
    Emitter<RemoteArticlesState> emit,
  ) async {
    final result = await _getArticleUseCase(NoParams());

    result.fold(
      (l) => emit(RemoteArticlesError(l.message)),
      (r) => _emitGetNewsSuccess(r, emit),
    );
  }

  void _emitGetNewsSuccess(
    NewsApiResponseEntity newsApiResponseEntity,
    Emitter<RemoteArticlesState> emit,
  ) {
    final articles = newsApiResponseEntity.articles;
    emit(RemoteArticlesDone(articles));
  }
}
