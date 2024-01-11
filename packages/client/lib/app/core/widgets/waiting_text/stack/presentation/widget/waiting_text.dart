import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'canvas/waiting_text_painter.dart';

class WaitingText extends HookWidget {
  final WaitingTextStore store;
  const WaitingText({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    final width = screenSize.width;
    final height = screenSize.height;
    return FullScreen(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * .01,
            right: width * .01,
          ),
          child: Stack(
            children: [
              CustomPaint(
                size: useFullScreenSize(),
                painter: WaitingTextPainter(),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * .25),
                  child: Text(
                    "WAIT NG",
                    style: GoogleFonts.jost(
                      fontSize: width * .15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 80.0),
              //     child: Text(
              //       "WAITING",
              //       style: GoogleFonts.jost(
              //         fontSize: width * .15,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
