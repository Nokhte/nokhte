// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/text_editors/core/mobx/base_text_editor_store.dart';
import 'package:primala/app/core/widgets/text_editors/solo_text_editor/stack/constants/data/text_editor_constants.dart';

class BaseTextEditor extends StatefulWidget {
  final BaseTextEditorStore trackerStore;

  const BaseTextEditor({
    super.key,
    required this.trackerStore,
  });

  @override
  State<StatefulWidget> createState() =>
      _BaseTextEditorState(trackerStore: trackerStore);
}

class _BaseTextEditorState extends State<BaseTextEditor> {
  final BaseTextEditorStore trackerStore;
  _BaseTextEditorState({required this.trackerStore});
  @override
  void dispose() {
    super.dispose();
    trackerStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: PlatformTextField(
        onTapOutside: (event) => trackerStore.focusNode.unfocus(),
        onTap: () => trackerStore.handleTap(),
        controller: trackerStore.controller,
        focusNode: trackerStore.focusNode,
        maxLength: TextEditorConstants.maxLength,
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
