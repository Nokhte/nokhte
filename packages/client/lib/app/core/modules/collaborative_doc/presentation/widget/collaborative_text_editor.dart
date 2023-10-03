// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/text_editor/core/core.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';

class CollaborativeTextEditor extends StatefulWidget {
  final CollaborativeTextEditorTrackerStore trackerStore;

  const CollaborativeTextEditor({
    super.key,
    required this.trackerStore,
  });

  @override
  State<StatefulWidget> createState() => _CollaborativeTextEditorState();
}

class _CollaborativeTextEditorState extends State<CollaborativeTextEditor> {
  @override
  void dispose() {
    super.dispose();
    widget.trackerStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseTextEditor(
          maxLength: 95,
          maxLines: 5,
          trackerStore: widget.trackerStore.collaboratorStore,
        ),
        BaseTextEditor(
          maxLength: 95,
          maxLines: 5,
          trackerStore: widget.trackerStore.userStore,
        ),
      ],
    );
  }
}
