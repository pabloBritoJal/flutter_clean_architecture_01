import 'package:flutter/foundation.dart';

mixin NewsApiEnvironmnet {
  static const apiKey = 'ff957763c54c44d8b00e5e082bc76cb0';

  Uri url({
    String? country = 'us',
    String? category = 'general',
    String? q,
    String? from,
    String? sortBy = 'popularity',
  }) {
    final queryParameters = {
      'country': country,
      'category': category,
      'q': q,
      'from': from,
      'sortBy': sortBy,
      'apiKey': apiKey,
    };

    queryParameters.removeWhere((key, value) => value == null);

    final uri = Uri.https('newsapi.org', '/v2/top-headlines', queryParameters);

    if (kDebugMode) {
      debugPrint('$uri');
    }
    return uri;
  }

  Map<String, String> headers() {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }
}
