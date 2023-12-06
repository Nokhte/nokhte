import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';

class SmartText extends StatelessWidget {
  final SmartTextStore stateTrackerStore;
  const SmartText({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: stateTrackerStore.showText ? 1 : 0,
        duration: const Duration(milliseconds: 500), // Adjust fade duration
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformText(
                stateTrackerStore.currentMainText,
                textAlign: TextAlign.center,
                style: GoogleFonts.kantumruyPro(
                  fontSize: stateTrackerStore.currentMainMessageFont,
                  color: Colors.white,
                ),
              ),
              PlatformText(
                stateTrackerStore.currentSubText,
                textAlign: TextAlign.center,
                style: GoogleFonts.kantumruyPro(
                  fontSize: stateTrackerStore.currentSubMessageFont,
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
