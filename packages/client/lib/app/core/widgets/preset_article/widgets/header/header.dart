import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

export './widgets/widgets.dart';

class ArticleHeader {
  static List<Widget> get({
    required String title,
    required String tagline,
    required String uniqueFeature,
  }) {
    return [
      ArticleTitle(title),
      TagLine(tagline),
      Callout(uniqueFeature),
    ];
  }
}
