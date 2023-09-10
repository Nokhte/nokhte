// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/text_editor/mobx.dart';
import 'package:primala/app/core/widgets/text_editor/core/widget/bare_text_editor.dart';

class SoloTextEditor extends StatefulWidget {
  final SoloTextEditorTrackerStore trackerStore;

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
    return BaseTextEditor(
      trackerStore: trackerStore,
    );
  }
}
