import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
export 'expanded_preset_cards_store.dart';

class ExpandedPresetsCards extends HookWidget with PresetTags {
  final ExpandedPresetCardsStore store;
  final String chosenName;
  final List chosenTags;

  const ExpandedPresetsCards({
    super.key,
    required this.store,
    required this.chosenName,
    required this.chosenTags,
  });

  Widget buildIcons(
    double containerSize,
  ) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fromTagsToWidgets(
            chosenTags,
            opacity: 1.0,
            containerSize: containerSize,
            shouldAnimate: true,
            isHorizontal: false,
            bottomPadding: containerSize * .1,
            addText: true,
          ));

  @override
  build(context) {
    final size = useFullScreenSize();
    final width = size.width;
    final height = size.width;
    final squareSize = (width < height ? width : height) * 0.8;
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: height * .3, right: width * .02),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [Colors.white],
                          stops: [0.0],
                        ),
                        width: 4,
                      ),
                    ),
                    height: squareSize,
                    width: squareSize,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: height * .05,
                            // bottom: height * .5,
                          ),
                          child: Jost(chosenName),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: height * .05,
                            top: height * .07,
                          ),
                          child: buildIcons(squareSize * .65),
                        ),
                      ],
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: height * .55, right: width * .02),
                child: ClipRect(
                  child: Align(
                    heightFactor: .6,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [Colors.white],
                            stops: [0.0],
                          ),
                          width: 4,
                        ),
                      ),
                      height: squareSize * .15,
                      width: squareSize * .8,
                      child: Padding(
                        padding: EdgeInsets.only(top: height * .042),
                        child: Jost(
                          "Tap anywhere to dismiss",
                          fontSize: squareSize * .05,
                          shouldCenter: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //
  }
}
