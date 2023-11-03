// * Mobx Import
// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/text_editors/shared/shared.dart';
// * Mobx Codegen Inclusion
part 'collaborative_text_editor_tracker_store.g.dart';

class CollaborativeTextEditorTrackerStore = _CollaborativeTextEditorTrackerStoreBase
    with _$CollaborativeTextEditorTrackerStore;

abstract class _CollaborativeTextEditorTrackerStoreBase
    extends BaseTextEditorStore with Store {
  @action
  setText(String message) {
    controller.text = message;
  }

  @observable
  bool showWidget = false;
  // bool showWidget = true;

  @action
  toggleWidgetVisibility() {
    showWidget = !showWidget;
  }

  @override
  List<Object> get props => [];
}
