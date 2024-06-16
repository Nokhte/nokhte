import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

mixin PresetTags {
  Widget getTag(double containerSize, Widget child, int i) => Padding(
        padding: EdgeInsets.only(right: containerSize * .04),
        child: child,
      );

  Widget getTextWidget(String text, double containerSize) => Padding(
      padding: EdgeInsets.only(left: containerSize * .02),
      child: Jost(text, fontSize: containerSize * .07));

  Widget getPaddedTag(Widget tagWidget, bool addText, String tagCode,
          double containerSize) =>
      addText
          ? Row(children: [
              tagWidget,
              getTextWidget(getText(tagCode), containerSize)
            ])
          : tagWidget;

  getText(String tagCode) {
    if (tagCode == 'hold_to_speak') {
      return 'Hold to speak';
    } else if (tagCode == 'tap_to_speak') {
      return 'Tap to speak';
    } else if (tagCode == 'notes_during') {
      return 'Take notes during the meeting';
    } else if (tagCode == 'notes_after') {
      return 'Take notes after the meeting';
    } else if (tagCode == 'flexible_seating') {
      return 'Sit wherever you want';
    } else if (tagCode == 'strict_seating') {
      return 'Sit next to each other';
    }
  }

  List<Widget> fromTagsToWidgets(
    tags, {
    required double opacity,
    required double containerSize,
    bool shouldAnimate = false,
    bool isHorizontal = true,
    bool addText = false,
    double bottomPadding = 0,
  }) {
    final List<Widget> temp = [];
    for (int i = 0; i < tags.length; i++) {
      final tag = tags[i];
      if (tag == 'hold_to_speak') {
        if (i == 0 && isHorizontal) {
          temp.add(
            Container(
              width: containerSize * .02,
            ),
          );
        }
        temp.add(getPaddedTag(
          getTag(
              containerSize,
              TalkingIcons(
                shouldAnimate: shouldAnimate,
                containerSize: containerSize,
                opacity: opacity,
                isHoldToTalk: true,
              ),
              i),
          addText,
          tag,
          containerSize,
        ));
      } else if (tag == 'tap_to_speak') {
        temp.add(getPaddedTag(
          getTag(
              containerSize,
              TalkingIcons(
                shouldAnimate: shouldAnimate,
                containerSize: containerSize,
                opacity: opacity,
                isHoldToTalk: false,
              ),
              i),
          addText,
          tag,
          containerSize,
        ));
      } else if (tag == 'notes_during' || tag == 'notes_after') {
        temp.add(getPaddedTag(
          getTag(
              containerSize,
              NotesIcon(
                shouldAnimate: shouldAnimate,
                containerSize: containerSize,
                opacity: opacity,
              ),
              i),
          addText,
          tag,
          containerSize,
        ));
      } else if (tag == 'flexible_seating') {
        temp.add(
          getPaddedTag(
            getTag(
                containerSize,
                FlexibleSeatingIcon(
                  shouldAnimate: shouldAnimate,
                  containerSize: containerSize,
                  opacity: opacity,
                ),
                i),
            addText,
            tag,
            containerSize,
          ),
        );
      } else if (tag == 'strict_seating') {
        temp.add(
          getPaddedTag(
            getTag(
              containerSize,
              StrictSeatingIcon(
                shouldAnimate: shouldAnimate,
                containerSize: containerSize,
                opacity: opacity,
              ),
              i,
            ),
            addText,
            tag,
            containerSize,
          ),
        );
      }
      if (bottomPadding != 0) {
        temp.add(
          Container(
            height: bottomPadding,
          ),
        );
      }
    }
    return temp;
  }
}
