import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TagLine extends StatelessWidget {
  final String text;
  final TextStyle textStyle = GoogleFonts.jost(
    fontSize: 15,
  );

  TagLine(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        TextPainter textPainter = TextPainter(
          text: TextSpan(text: text, style: textStyle),
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(
          maxWidth: constraints.maxWidth - 50,
        );

        double textHeight = textPainter.size.height;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 40),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                width: 2,
                height: textHeight - 5,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Jost(
                text,
                shouldItalicize: true,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 80),
          ],
        );
      },
    );
  }
}
