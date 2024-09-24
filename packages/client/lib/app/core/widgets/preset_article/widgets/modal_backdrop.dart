import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ModalBackdrop extends StatelessWidget {
  final String title;
  final String tagline;
  final String uniqueFeature;
  const ModalBackdrop({
    super.key,
    required this.title,
    required this.tagline,
    required this.uniqueFeature,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: .91,
      initialChildSize: .9,
      minChildSize: .7,
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ...ArticleHeader.get(
              title: title,
              tagline: tagline,
              uniqueFeature: uniqueFeature,
            ),
            ArticleBody(
              store: ArticleBodyStore(),
            ),
          ],
        ),
      ),
    );
  }
}
