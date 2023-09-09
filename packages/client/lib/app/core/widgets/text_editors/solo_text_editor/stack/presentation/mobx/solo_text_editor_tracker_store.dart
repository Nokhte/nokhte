// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/widgets/text_editors/core/mobx/base_text_editor_store.dart';
// * Mobx Codegen Inclusion
part 'solo_text_editor_tracker_store.g.dart';

class SoloTextEditorTrackerStore = _SoloTextEditorTrackerStoreBase
    with _$SoloTextEditorTrackerStore;

abstract class _SoloTextEditorTrackerStoreBase extends BaseTextEditorStore
    with Store {
  @override
  @action
  handleTap() {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
    // }
  }

  @override
  @action
  addEventListeners() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print("A USER JUST WENT INTO THE TEXT DOC");
      } else {
        print("A USER JUST LEFT THE TEXT DOC");
      }
    });
    controller.addListener(() {
      // final selection = controller.selection;
      // print(controller.text); <=== wonderful this is how you push text
      // print('Cursor Start: ${selection.start}, Cursor End: ${selection.end}');
    });
  }

  @override
  List<Object> get props => [
// some items
      ];
}
