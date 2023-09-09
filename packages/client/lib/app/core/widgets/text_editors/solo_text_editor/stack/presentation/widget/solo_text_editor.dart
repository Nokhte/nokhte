// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/text_editors/core/mobx/base_text_editor_store.dart';
import 'package:primala/app/core/widgets/text_editors/core/widget/bare_text_editor.dart';

class SoloTextEditor extends StatefulWidget {
  final BaseTextEditorStore trackerStore;

  const SoloTextEditor({
    super.key,
    required this.trackerStore,
  });

  @override
  State<StatefulWidget> createState() => _SoloTextEditorState(
        trackerStore: trackerStore,
      );
}

class _SoloTextEditorState extends State<SoloTextEditor> {
  final BaseTextEditorStore trackerStore;
  _SoloTextEditorState({required this.trackerStore});
  @override
  void dispose() {
    super.dispose();
    trackerStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: BaseTextEditor(
        trackerStore: trackerStore,
      ),
    );
  }
}
