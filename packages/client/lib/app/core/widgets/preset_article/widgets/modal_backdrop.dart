import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ModalBackdrop extends StatelessWidget {
  final ArticleBodyStore store;
  const ModalBackdrop({
    super.key,
    required this.store,
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
              title: store.bodyInfo.title,
              tagline: store.bodyInfo.tagline,
              uniqueFeature: store.bodyInfo.uniqueFeature,
            ),
            ArticleBody(
              store: store,
            ),
          ],
        ),
      ),
    );
  }
}
