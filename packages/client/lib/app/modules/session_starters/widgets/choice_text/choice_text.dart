import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
export 'choice_text_store.dart';

class ChoiceText extends HookWidget {
  final ChoiceTextStore store;
  const ChoiceText({
    super.key,
    required this.store,
  });

  _buildTextStyle({
    required double fontSize,
    bool useItalics = false,
    bool isVisible = true,
  }) =>
      GoogleFonts.jost(
          color: isVisible ? Colors.white : Colors.transparent,
          fontSize: fontSize,
          fontStyle: useItalics ? FontStyle.italic : FontStyle.normal);

  @override
  build(context) {
    final width = useFullScreenSize().width;
    final height = useFullScreenSize().height;
    final fontSize = width * .05;

    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: Padding(
          padding: EdgeInsets.only(bottom: height * .33),
          child: Stack(
            children: [
              Center(
                child: GradientText(
                  "starting                  ",
                  colors: SessionStarterConstants.blueGrad,
                  gradientDirection: GradientDirection.ttb,
                  style: _buildTextStyle(
                    fontSize: fontSize,
                    useItalics: true,
                  ),
                ),
              ),
              Center(
                child: GradientText(
                  "           joining",
                  colors: SessionStarterConstants.orangeGrad,
                  gradientDirection: GradientDirection.ttb,
                  style: _buildTextStyle(
                    fontSize: fontSize,
                    useItalics: true,
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Are you ",
                        style: _buildTextStyle(fontSize: fontSize),
                      ),
                      TextSpan(
                        text: "starting ",
                        style: _buildTextStyle(
                            fontSize: fontSize, isVisible: false),
                      ),
                      TextSpan(
                        text: "or ",
                        style: _buildTextStyle(fontSize: fontSize),
                      ),
                      TextSpan(
                        text: "joining ",
                        style: _buildTextStyle(
                            fontSize: fontSize, isVisible: false),
                      ),
                      TextSpan(
                        text: "a session?",
                        style: _buildTextStyle(fontSize: fontSize),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .1),
                child: Center(
                  child: Text(
                    "Tap to decide",
                    style: _buildTextStyle(
                      fontSize: fontSize * .8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
