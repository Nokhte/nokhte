import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/hooks/use_square_size.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
export './mobx/article_body_store.dart';
export './types/types.dart';
export 'utils/utils.dart';
export './widgets/widgets.dart';

class ArticleBody extends HookWidget with ArticleBodyUtils {
  final ArticleBodyStore store;
  const ArticleBody({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final containerSize = useSquareSize(relativeLength: .4).height;
    return Observer(builder: (context) {
      return Column(
        children: [
          ArticleCarouselSlider(
            onScrolled: (value) {
              store.setCurrentPosition(value);
            },
            onPageChanged: (currentIndex) {
              store.setActiveIndex(currentIndex);
            },
            tags: store.tags,
            containerSize: containerSize,
            currentPosition: store.currentPosition,
          ),
          ArticleContent(
            currentInstructionsHeader: store.currentInstructionsHeader,
            currentInstructionsBody: store.currentInstruction,
            currentJustifications: store.currentJustification,
            demoType: store.currentDemo,
            opacity: contentLerp(store.currentPosition),
            currentPosition: store.currentPosition,
          ),
        ],
      );
    });
  }
}
