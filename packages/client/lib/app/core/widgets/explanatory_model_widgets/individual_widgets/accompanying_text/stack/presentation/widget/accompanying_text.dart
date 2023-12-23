import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class AccompanyingText extends StatelessWidget {
  final AccompanyingTextStore store;
  final double bottomPadding;
  final String content;
  final ModelGradientOptions gradient;
  const AccompanyingText(
    this.content, {
    super.key,
    required this.store,
    required this.gradient,
    this.bottomPadding = 0.0,
  });
  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => FullScreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: useWidgetOpacity(store.showWidget),
                duration: Seconds.get(0),
                child: GradientText(
                  content,
                  colors: gradient == ModelGradientOptions.user
                      ? ModelGradients.userGradient
                      : ModelGradients.collaboratorGradient,
                  style: GoogleFonts.jost(fontSize: 23.0),
                  gradientDirection: GradientDirection.ttb,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: bottomPadding,
                ),
              ),
            ],
          ),
        ),
      );
}
