// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/text_editor/stack/presentation/mobx/text_editor_tracker_store.dart';

class TextEditor extends StatelessWidget {
  final TextEditorTrackerStore trackerStore;

  const TextEditor({
    super.key,
    required this.trackerStore,
  });

  @override
  Widget build(BuildContext context) {
    // return Column(
    // alignment: Alignment.centerLeft,
    // children: [
    return GestureDetector(
      onTap: () => print("tap"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        // child: PlatformText("HI")

        child: PlatformTextField(
          onTapOutside: (event) => trackerStore.focusNode.unfocus(),
          onTap: () => trackerStore.handleTap(),
          controller: trackerStore.controller,
          focusNode: trackerStore.focusNode,
          maxLines: 4,
          maxLength: 38,
          // textAlign: TextAlign.center,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
          cursorColor: Colors.red,
          hintText: "Something here",
          material: (_, __) => MaterialTextFieldData(),
          cupertino: (_, __) => CupertinoTextFieldData(
            placeholderStyle: TextStyle(
              color: Colors.white.withOpacity(
                .30,
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
