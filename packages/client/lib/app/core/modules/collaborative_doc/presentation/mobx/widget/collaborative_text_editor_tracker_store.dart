// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'sub_stores/sub_stores.dart';
// * Mobx Codegen Inclusion
part 'collaborative_text_editor_tracker_store.g.dart';

class CollaborativeTextEditorTrackerStore = _CollaborativeTextEditorTrackerStoreBase
    with _$CollaborativeTextEditorTrackerStore;

abstract class _CollaborativeTextEditorTrackerStoreBase extends Equatable
    with Store {
  final UserTextEditorTrackerStore userStore;

  _CollaborativeTextEditorTrackerStoreBase({
    required this.userStore,
  });

  @action
  setText(String message) {
    userStore.controller.text = message;
  }

  @observable
  bool showWidget = false;

  @action
  flipWidgetVisibility() {
    showWidget = !showWidget;
    // print("was this working??? $showWidget");
  }

  @action
  dispose() {
    userStore.dispose();
  }

  @override
  List<Object> get props => [];
}
