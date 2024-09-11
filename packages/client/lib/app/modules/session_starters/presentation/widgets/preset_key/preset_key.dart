// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PresetKey extends HookWidget {
  final bool showWidget;
  const PresetKey({
    super.key,
    required this.showWidget,
  });

  getContainer(List<Color> colors, String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(
          color: Colors.white, // Border color
          width: 2, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 15.0,
        ),
        child: GradientText(text,
            style: GoogleFonts.jost(
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            colors: colors),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    return AnimatedOpacity(
      opacity: useWidgetOpacity(showWidget),
      duration: Seconds.get(1),
      child: FullScreen(
        child: Padding(
          padding: EdgeInsets.only(
            top: useScaledSize(
              baseValue: 0.24,
              bumpPerHundredth: -0.001,
              screenSize: screenSize,
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getContainer([const Color(0xFF00FF47), const Color(0xFF27FCFC)],
                    'Tap to explore'),
                getContainer([
                  const Color(0xFFF8FC27),
                  const Color(0xFF5BFF41),
                ], 'Hold to select'),
              ]),
        ),
      ),
    );
  }
}
