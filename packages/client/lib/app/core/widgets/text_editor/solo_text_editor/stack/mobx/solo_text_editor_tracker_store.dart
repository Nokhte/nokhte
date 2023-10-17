// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
// import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/widgets/text_editor/core/mobx/base_text_editor_store.dart';
// * Mobx Codegen Inclusion
part 'solo_text_editor_tracker_store.g.dart';

class SoloTextEditorTrackerStore = _SoloTextEditorTrackerStoreBase
    with _$SoloTextEditorTrackerStore;

abstract class _SoloTextEditorTrackerStoreBase extends BaseTextEditorStore
    with Store {
  @observable
  bool showWidget = false;

  @action
  flipWidgetVisibility() {
    showWidget = !showWidget;
    // print("was this working??? $showWidget");
  }
}
