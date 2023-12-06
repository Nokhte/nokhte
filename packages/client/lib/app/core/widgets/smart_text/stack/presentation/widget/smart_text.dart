import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';

class SmartText extends StatelessWidget {
  final SmartTextStore store;
  const SmartText({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: store.showWidget ? 1 : 0,
        onEnd: store.onOpacityTransitionComplete(store.showWidget),
        duration: Seconds.get(0, milli: 500), // Adjust fade duration
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformText(
                store.currentMainText,
                textAlign: TextAlign.center,
                style: GoogleFonts.kantumruyPro(
                  fontSize: store.currentMainMessageFontSize,
                  color: Colors.white,
                ),
              ),
              PlatformText(
                store.currentSubText,
                textAlign: TextAlign.center,
                style: GoogleFonts.kantumruyPro(
                  fontSize: store.currentSubMessageFontSize,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
