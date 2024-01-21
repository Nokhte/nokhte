import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TextEditor extends HookWidget {
  final TextEditorStore store;
  final Duration fadeInDuration;
  final int maxLines;
  final int maxLength;
  final double bottomPadding;
  final double fontScalar;

  const TextEditor({
    super.key,
    required this.store,
    this.fadeInDuration = const Duration(seconds: 1),
    this.maxLength = 104,
    this.maxLines = 6,
    this.bottomPadding = 0.0,
    this.fontScalar = 0.04,
  });

  @override
  Widget build(BuildContext context) {
    final computedPadding = MediaQuery.of(context).viewInsets.bottom * .7;
    final fontSize = MediaQuery.of(context).size.height * fontScalar;
    return Observer(
      builder: (context) {
        return AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: fadeInDuration,
          child: Padding(
            padding: EdgeInsets.only(
              left: 35.0,
              right: 35.0,
              bottom: computedPadding.isLessThan(0) ? 0 : computedPadding,
            ),
            child: Theme(
              data: ThemeData(
                  textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Color.fromARGB(255, 7, 190, 172),
              )),
              child: TextField(
                keyboardType: TextInputType.name,
                onTapOutside: (event) => store.focusNode.unfocus(),
                onTap: () => store.handleTap(),
                controller: store.controller,
                focusNode: store.focusNode,
                maxLines: maxLines,
                readOnly: false,
                maxLength: maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                style: GoogleFonts.jost(
                  fontSize: fontSize,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Your Answer",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.4)),
                  counterStyle: GoogleFonts.jost(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
