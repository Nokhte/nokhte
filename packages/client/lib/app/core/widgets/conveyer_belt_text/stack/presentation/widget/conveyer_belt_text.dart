import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/presentation/presentation.dart';
import 'package:google_fonts/google_fonts.dart';

class ConveyerBeltText extends StatelessWidget {
  final ConveyerBeltTextStore trackerStore;
  final Size size;
  const ConveyerBeltText({
    super.key,
    required this.size,
    required this.trackerStore,
  });

  @override
  Widget build(BuildContext context) {
    print(
        "LM ${trackerStore.leftMostValue} L ${trackerStore.leftValue} C ${trackerStore.centerValue} R ${trackerStore.rightValue} RM ${trackerStore.rightMostValue}");
    print("${trackerStore.theFocusedList.toString()} ");
    print(
        "${trackerStore.currentlySelectedIndex} ${trackerStore.focusListCardinalLength}");
    // print("${trackerStore.leftValue}");
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 95.0),
            child: Center(
              child: Padding(
                padding: index == 0
                    ? EdgeInsets.all(15.0)
                    : const EdgeInsets.only(left: 50.0),
                child: PlatformText(
                  style: GoogleFonts.jost(
                    fontSize: 30.0,
                  ),
                  trackerStore.theFocusedList[index].formatted,
                ),
              ),
            ),
          );
        });
  }
}
