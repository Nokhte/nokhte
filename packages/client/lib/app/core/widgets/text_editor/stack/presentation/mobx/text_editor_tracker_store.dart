// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'text_editor_tracker_store.g.dart';

class TextEditorTrackerStore = _TextEditorTrackerStoreBase
    with _$TextEditorTrackerStore;

abstract class _TextEditorTrackerStoreBase extends Equatable with Store {
  @observable
  TextEditingController controller = TextEditingController();

  @observable
  FocusNode focusNode = FocusNode();

  @action
  handleTap() {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
    // }
  }

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

  @action
  dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  @override
  List<Object> get props => [
// some items
      ];
}
