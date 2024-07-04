// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

export 'preset_icons_store.dart';

class PresetIcons extends HookWidget with PresetTags {
  final PresetIconsStore store;
  const PresetIcons({
    super.key,
    required this.store,
  });

  Widget buildHorizontalIcons(
    int i, {
    required double containerSize,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: fromTagsToWidgets(
          store.tags,
          containerSize: containerSize,
        ),
      );

  Widget buildVerticalIcons(
    double containerSize,
  ) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fromTagsToWidgets(
            store.tags,
            containerSize: containerSize,
            shouldAnimate: true,
            isHorizontal: false,
            bottomPadding: containerSize * .1,
            addText: true,
          ));

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    final containerSize = height * store.containerSize;
    return Observer(
      builder: (context) {
        return AnimatedOpacity(
            opacity: useWidgetOpacity(store.showWidget),
            duration: Seconds.get(1),
            child: store.isHorizontal
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: fromTagsToWidgets(
                      store.tags,
                      containerSize: containerSize,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: fromTagsToWidgets(
                      store.tags,
                      containerSize: containerSize,
                      shouldAnimate: true,
                      isHorizontal: false,
                      bottomPadding: containerSize * .1,
                      addText: true,
                    ),
                  ));
      },
    );
    // return store.isHorizontal ? Container() : Container();
  }
}
