// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
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
  State<StatefulWidget> createState() => _CollaborativeTextEditorState(
        trackerStore: trackerStore,
      );
}

class _CollaborativeTextEditorState extends State<CollaborativeTextEditor> {
  final CollaborativeTextEditorTrackerStore trackerStore;
  _CollaborativeTextEditorState({required this.trackerStore});
  @override
  void dispose() {
    super.dispose();
    trackerStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(30.0),
        //   child:
        BaseTextEditor(
          maxLength: 95,
          maxLines: 5,
          trackerStore: trackerStore.collaboratorStore,
        ),
        // ),
        BaseTextEditor(
          maxLength: 95,
          maxLines: 5,
          trackerStore: trackerStore.userStore,
        ),
      ],
    );
  }
}
