import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

export 'choice_buttons_store.dart';

class ChoiceButtons extends HookWidget {
  final ChoiceButtonsStore store;
  const ChoiceButtons({
    super.key,
    required this.store,
  });

  Widget getBorderContainer({
    required double size,
    required List<Color> gradientColors,
    required String text,
    required double fontSize,
  }) =>
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
            ),
            child: Center(
              child: GradientText(
                text,
                gradientDirection: GradientDirection.ttb,
                colors: gradientColors,
                style: GoogleFonts.jost(
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  build(context) {
    final width = useFullScreenSize().width;
    final height = useFullScreenSize().height;
    final fontSize = width * .06;
    return Observer(
      builder: (context) {
        return AnimatedOpacity(
            duration: Seconds.get(1),
            opacity: useWidgetOpacity(store.showWidget),
            child: Padding(
              padding: EdgeInsets.only(top: height * .13),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => store.onTap(ChoiceButtonType.starting),
                      child: getBorderContainer(
                        size: height * .14,
                        gradientColors: const [
                          Color(0xFF40F3F4),
                          Color(0xFF40BCF4),
                          Color(0xFF4073F3),
                        ],
                        text: 'Starting',
                        fontSize: fontSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => store.onTap(ChoiceButtonType.joining),
                      child: getBorderContainer(
                        size: height * .14,
                        gradientColors: SessionStarterConstants.orangeGrad,
                        text: 'Joining',
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
