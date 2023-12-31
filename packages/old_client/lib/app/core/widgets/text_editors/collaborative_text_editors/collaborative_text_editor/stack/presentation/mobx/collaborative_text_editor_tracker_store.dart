// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/text_editors/shared/shared.dart';
part 'collaborative_text_editor_tracker_store.g.dart';

class CollaborativeTextEditorTrackerStore = _CollaborativeTextEditorTrackerStoreBase
    with _$CollaborativeTextEditorTrackerStore;

abstract class _CollaborativeTextEditorTrackerStoreBase
    extends BaseTextEditorStore with Store {
  @observable
  bool isReadOnly = false;

  _CollaborativeTextEditorTrackerStoreBase({required this.isReadOnly});

  @observable
  bool showWidget = false;

  @action
  toggleWidgetVisibility() {
    showWidget = !showWidget;
  }

  @override
  List<Object> get props => [];
}
