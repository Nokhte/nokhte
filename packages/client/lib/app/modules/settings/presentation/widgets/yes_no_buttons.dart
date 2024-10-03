import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class YesNoButtons extends HookWidget {
  final bool showWidget;
  final Function onYes;
  final Function onNo;
  const YesNoButtons({
    super.key,
    required this.showWidget,
    required this.onYes,
    required this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    final width = useFullScreenSize().width;
    return AnimatedOpacity(
      opacity: useWidgetOpacity(showWidget),
      duration: Seconds.get(1),
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.5,
        ), // Adjust top padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Yes Button
            GestureDetector(
              onTap: () => onYes(),
              child: Container(
                width: width * 0.35,
                height: 50,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Center(
                  child: Jost(
                    'yes',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20), // Space between buttons
            // No Button
            GestureDetector(
              onTap: () => onNo(),
              child: Container(
                width: width * 0.35,
                height: 50,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Center(
                  child: Jost('no', fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
