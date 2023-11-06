// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../shared.dart';

class BaseTextEditor extends StatelessWidget {
  final BaseTextEditorStore trackerStore;
  final int maxLines;
  final int maxLength;
  final bool isReadOnly;

  const BaseTextEditor({
    super.key,
    required this.trackerStore,
    required this.maxLength,
    required this.maxLines,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: PlatformTextField(
        keyboardType: TextInputType.name,
        onTapOutside: (event) => trackerStore.focusNode.unfocus(),
        onTap: () => trackerStore.handleTap(),
        controller: trackerStore.controller,
        focusNode: trackerStore.focusNode,
        maxLines: maxLines,
        readOnly: isReadOnly,
        // onSubmitted: (_) => FocusScope.of(context).unfocus(),
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        style: TextEditorConstants.mainTextStyle,
        cursorColor: TextEditorConstants.soloCursorColor,
        hintText: "Something here",
        material: (_, __) => MaterialTextFieldData(),
        cupertino: (_, __) => CupertinoTextFieldData(
          placeholderStyle: TextEditorConstants.hintTextStyle,
          decoration: const BoxDecoration(),
        ),
      ),
    );
  }
}
