import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'movies/movies.dart';
export 'condensed_presets_cards_store.dart';

class CondensedPresetsCards extends HookWidget {
  final CondensedPresetsCardsStore store;
  const CondensedPresetsCards({
    super.key,
    required this.store,
  });

  Widget buildSquareContainers(
    int index,
    double squareSize,
    double height,
    double size,
  ) {
    int adjustedIndex = index * 2;
    bool indexIsEmpty = (adjustedIndex + 1) < store.names.length;
    String leftText = store.names[adjustedIndex];
    String rightText = indexIsEmpty ? store.names[adjustedIndex + 1] : '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildSquare(
          leftText,
          height,
          size,
        ),
        buildSquare(
          rightText,
          height,
          size,
        ),
      ],
    );
  }

  BoxDecoration buildSquareDecoration(Movie value, bool textIsEmpty) {
    return textIsEmpty
        ? const BoxDecoration()
        : BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: [
                  value.get('c1'),
                  value.get('c2'),
                  value.get('c3'),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              width: 3,
            ),
          );
  }

  Widget buildText(Movie value, String text, double height) {
    return text.isEmpty
        ? Container()
        : Padding(
            padding: EdgeInsets.only(top: height * .02),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  value.get('c1'),
                  value.get('c2'),
                  value.get('c3'),
                ],
                stops: const [0.0, 0.5, 1.0],
              ).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                  fontSize: height * .059,
                  // color: fontColor,
                ),
              ),
            ),
          );
  }

  Widget buildSquare(
    String text,
    double height,
    double size,
  ) {
    final i = store.names.indexOf(text);
    if (text.isEmpty) {
      return SizedBox(
        height: size,
        width: size,
      );
    } else {
      return CustomAnimationBuilder(
        tween: store.movies[i],
        duration: store.movies[i].duration,
        control: store.controls[i],
        builder: (context, value, child) => GestureDetector(
          onTap: () => print("TAP  $i"),
          onLongPressStart: (details) => print("HOLD $i"),
          child: Container(
            decoration: buildSquareDecoration(value, text.isEmpty),
            height: size,
            width: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(value, text, height),
                buildIcons(
                  i,
                  opacity: store.showTags ? value.get('c1').opacity : 0,
                  containerSize: size,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget buildIcons(
    int i, {
    required double opacity,
    required double containerSize,
  }) =>
      Padding(
        padding: EdgeInsets.only(
            right: containerSize * .0, bottom: containerSize * .04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: fromTagsToWidgets(
            store.tags[i],
            opacity: opacity,
            containerSize: containerSize,
          ),
        ),
      );

  Widget getTag(double containerSize, Widget child, int i) => Padding(
        padding: EdgeInsets.only(right: containerSize * .04),
        child: child,
      );

  List<Widget> fromTagsToWidgets(
    tags, {
    required double opacity,
    required double containerSize,
  }) {
    final List<Widget> temp = [];
    for (int i = 0; i < tags.length; i++) {
      final tag = tags[i];
      if (tag == 'hold_to_speak') {
        if (i == 0) {
          temp.add(
            Container(
              width: containerSize * .02,
            ),
          );
        }
        temp.add(
          getTag(
              containerSize,
              TalkingIcons(
                shouldAnimate: false,
                containerSize: containerSize,
                opacity: opacity,
                isHoldToTalk: true,
              ),
              i),
        );
      } else if (tag == 'tap_to_speak') {
        temp.add(
          getTag(
              containerSize,
              TalkingIcons(
                shouldAnimate: false,
                containerSize: containerSize,
                opacity: opacity,
                isHoldToTalk: false,
              ),
              i),
        );
      } else if (tag == 'notes_during' || tag == 'notes_after') {
        temp.add(
          getTag(
              containerSize,
              NotesIcon(
                containerSize: containerSize,
                opacity: opacity,
              ),
              i),
        );
      } else if (tag == 'flexible_seating') {
        temp.add(
          getTag(
              containerSize,
              FlexibleSeatingIcon(
                shouldAnimate: false,
                containerSize: containerSize,
                opacity: opacity,
              ),
              i),
        );
      } else if (tag == 'strict_seating') {
        temp.add(
          getTag(
            containerSize,
            StrictSeatingIcon(
              shouldAnimate: false,
              containerSize: containerSize,
              opacity: opacity,
            ),
            i,
          ),
        );
      }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    final size = useFullScreenSize();
    final width = size.width;
    final height = size.width;
    final squareSize = (width < height ? width : height) * 0.4;
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: Padding(
          padding: EdgeInsets.only(top: height * .3),
          child: ListView.separated(
            itemCount: (store.names.length / 2).ceil(),
            separatorBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.all(
                  height * .03,
                ),
                child: Container(),
              );
            },
            itemBuilder: (_, i) => buildSquareContainers(
              i,
              squareSize,
              height,
              squareSize,
            ),
          ),
        ),
      ),
    );

    // return Container();
  }
}
