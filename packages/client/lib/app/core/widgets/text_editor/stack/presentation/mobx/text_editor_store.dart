// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'text_editor_store.g.dart';

class TextEditorStore = _TextEditorStoreBase with _$TextEditorStore;

abstract class _TextEditorStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @observable
  TextEditingController controller = TextEditingController();

  @observable
  FocusNode focusNode = FocusNode();

  @action
  setText(String newContent) => controller.text = newContent;

  @action
  handleTap() {}

  @action
  addEventListeners() {}

  @action
  dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
