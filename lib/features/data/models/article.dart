import 'package:flutter_clean_architecture_01/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishdAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String,dynamic> json){
  return ArticleModel(
    author: json['author'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    url: json['url'] ?? '',
    urlToImage: json['urlToImage'] ?? '',
    publishdAt: json['publishdAt'] ?? '',
    content: json['content'] ?? '',
  );
}
}

