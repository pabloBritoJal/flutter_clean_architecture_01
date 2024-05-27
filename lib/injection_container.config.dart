// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i5;

import 'core/api/client/simple_http.dart' as _i3;
import 'core/network/connection_checker.dart' as _i4;
import 'features/daily_news/data/datasources/remote/i_news_api_services.dart'
    as _i6;
import 'features/daily_news/data/datasources/remote/news_api_services.dart'
    as _i7;
import 'features/daily_news/data/repository/article_repository.dart' as _i9;
import 'features/daily_news/domain/i_repository/i_article_repository.dart'
    as _i8;
import 'features/daily_news/domain/usecases/get_article.dart' as _i10;
import 'features/daily_news/presentation/bloc/article/remote/bloc/remote_articles_bloc.dart'
    as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ISimpleHttp>(() => _i3.SimpleHttp());
  gh.factory<_i4.IConnectionChecker>(
      () => _i4.ConnectionChecker(gh<_i5.InternetConnection>()));
  gh.factory<_i6.INewsApiServicesDataSource>(
      () => _i7.NewsApiServicesDataSourse(gh<_i3.ISimpleHttp>()));
  gh.factory<_i8.IArticleRepository>(() => _i9.ArticleRepository(
        gh<_i6.INewsApiServicesDataSource>(),
        gh<_i4.IConnectionChecker>(),
      ));
  gh.factory<_i10.GetArticleUseCase>(
      () => _i10.GetArticleUseCase(gh<_i8.IArticleRepository>()));
  gh.factory<_i11.RemoteArticlesBloc>(
      () => _i11.RemoteArticlesBloc(gh<_i10.GetArticleUseCase>()));
  return getIt;
}
