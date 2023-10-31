// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:nokhte/app/core/widgets/text_editors/shared/shared.dart';

class CollaborativeTextEditor extends StatefulWidget {
  final CollaborativeTextEditorTrackerStore trackerStore;
  final Duration fadeInDuration;

  const CollaborativeTextEditor({
    super.key,
    required this.trackerStore,
    required this.fadeInDuration,
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
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: widget.trackerStore.showWidget ? 1 : 0,
        duration: widget.fadeInDuration,
        child: BaseTextEditor(
          maxLength: 65,
          maxLines: 5,
          trackerStore: widget.trackerStore,
        ),
      );
    });
  }
}
