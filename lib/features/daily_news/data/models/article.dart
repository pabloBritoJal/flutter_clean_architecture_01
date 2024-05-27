import 'package:flutter_clean_architecture_01/core/util/parse_from_dynamic.dart';

import '../../domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishdAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: ParseFromDynamic.parseToString(input: map['author']),
      title: ParseFromDynamic.parseToString(input: map['title']),
      description: ParseFromDynamic.parseToString(input: map['description']),
      url: ParseFromDynamic.parseToString(input: map['url']),
      urlToImage: ParseFromDynamic.parseToString(input: map['urlToImage']),
      publishdAt: ParseFromDynamic.parseToString(input: map['publishedAt']),
      content: ParseFromDynamic.parseToString(input: map['content']),
    );
  }
}
