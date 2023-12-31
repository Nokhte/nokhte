// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
part 'solo_text_editor_tracker_store.g.dart';

class SoloTextEditorTrackerStore = _SoloTextEditorTrackerStoreBase
    with _$SoloTextEditorTrackerStore;

abstract class _SoloTextEditorTrackerStoreBase extends BaseTextEditorStore
    with Store {
  @observable
  bool showWidget = true;

  @action
  flipWidgetVisibility() {
    showWidget = !showWidget;
  }
}
