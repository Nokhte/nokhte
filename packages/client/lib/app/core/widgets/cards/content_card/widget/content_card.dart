import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ContentCard extends HookWidget {
  final ContentCardStore store;
  final List content;
  ContentCard({
    super.key,
    required this.content,
    required this.store,
  });

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFF1F5BD0),
      Color(0xFF1FB0D0),
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: ListView.separated(
          itemCount: content.length,
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(height * .02),
            child: Container(),
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: height * .04),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(width: 2, color: Colors.white)),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1F5BD0),
                        Color(0xFF1FB0D0),
                      ],
                    ),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: TextFormField(
                        readOnly: true,
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jost(
                          fontSize: 18,
                          foreground: Paint()..shader = linearGradient,
                        ),
                        initialValue: content[index],
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
