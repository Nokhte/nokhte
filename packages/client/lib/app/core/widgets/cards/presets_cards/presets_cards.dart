import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

export 'presets_cards_store.dart';

class PresetsCards extends HookWidget {
  final PresetsCardsStore store;
  const PresetsCards({
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
          true,
          height,
          size,
        ),
        buildSquare(
          rightText,
          false,
          height,
          size,
        ),
      ],
    );
  }

  Widget buildSquare(
    String text,
    bool isLeftSide,
    double height,
    double size,
  ) {
    late BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        width: 3,
        color: Colors.white,
      ),
    );
    late Widget textWidget = Jost(
      text,
      fontSize: height * .059,
      shouldCenter: true,
    );
    if (text.isEmpty) {
      textWidget = Container();
      boxDecoration = const BoxDecoration();
    }

    return GestureDetector(
      onTap: () => print("TAP  ${store.names.indexOf(text)}"),
      onLongPressDown: (details) => print("HOLD ${store.names.indexOf(text)}"),
      child: Container(
        decoration: boxDecoration,
        height: size,
        width: size,
        child: textWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = useFullScreenSize();
    final width = size.width;
    final height = size.width;
    final squareSize = (width < height ? width : height) * 0.4;
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: ListView.separated(
          itemCount: (store.names.length / 2).ceil(),
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(
                height * .03,
              ),
              child: Container(),
            );
          },
          itemBuilder: (context, i) {
            return buildSquareContainers(
              i,
              squareSize,
              height,
              squareSize,
            );
          },
        ),
      ),
    );

    // return Container();
  }
}
