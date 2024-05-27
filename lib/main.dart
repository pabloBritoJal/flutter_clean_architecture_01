import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_01/config/theme/app_themes.dart';
import 'package:flutter_clean_architecture_01/features/daily_news/presentation/bloc/article/remote/bloc/remote_articles_bloc.dart';
import 'package:flutter_clean_architecture_01/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_clean_architecture_01/injection_container.dart';

main() {
  initializeDependencias();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<RemoteArticlesBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => getIt()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
