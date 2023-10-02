// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/text_editor/mobx.dart';
import 'package:primala/app/core/widgets/text_editor/core/widget/bare_text_editor.dart';

class SoloTextEditor extends StatefulWidget {
  final SoloTextEditorTrackerStore trackerStore;
  final Duration fadeInDuration;
  final int maxLines;
  final int maxLength;

  const SoloTextEditor({
    super.key,
    required this.trackerStore,
    required this.fadeInDuration,
    required this.maxLength,
    required this.maxLines,
  });

  @override
  State<StatefulWidget> createState() => _SoloTextEditorState();
}

class _SoloTextEditorState extends State<SoloTextEditor> {
  @override
  void dispose() {
    super.dispose();
    widget.trackerStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: widget.trackerStore.showWidget ? 1 : 0,
        duration: widget.fadeInDuration,
        child: BaseTextEditor(
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          trackerStore: widget.trackerStore,
        ),
      );
    });
  }
}
