// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'preset_article_store.g.dart';

class PresetArticleStore = _PresetArticleStoreBase with _$PresetArticleStore;

abstract class _PresetArticleStoreBase extends BaseWidgetStore with Store {
  final NokhteBlurStore nokhteBlur;
  _PresetArticleStoreBase({
    required this.nokhteBlur,
  }) {
    setWidgetVisibility(false);
  }
  late BuildContext buildContext;

  @action
  setBuildContext(BuildContext context) {
    return buildContext = context;
  }

  @action
  showBottomSheet({
    required Function onClosed,
  }) {
    if (!showWidget) {
      setWidgetVisibility(true);
      nokhteBlur.init();
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36), // Adjust this value for more radius
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white.withOpacity(.2),
        // expan: true,
        context: buildContext,
        builder: (context) {
          return const ModalBackdrop(
            title: 'Collaboration',
            tagline:
                'Great with smaller groups, and works best in creative endeavors',
            uniqueFeature: 'Flexibility: sit anywhere, notes anytime',
          );
        },
      ).whenComplete(() {
        onClosed();
        setWidgetVisibility(false);
        nokhteBlur.reverse();
        // print('bottom sheet closed');
      });
    }
  }
}
