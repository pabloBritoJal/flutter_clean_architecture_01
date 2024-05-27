part of 'remote_articles_bloc.dart';

sealed class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;

  const RemoteArticlesState({this.articles});

  @override
  List<Object?> get props => [articles];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticlesState {
  final String message;
  const RemoteArticlesError(this.message);
}
