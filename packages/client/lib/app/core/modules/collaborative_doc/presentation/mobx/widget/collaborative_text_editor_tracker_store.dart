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
  final CollaboratorTextEditorTrackerStore collaboratorStore;

  _CollaborativeTextEditorTrackerStoreBase({
    required this.userStore,
    required this.collaboratorStore,
  });

  @action
  dispose() {
    userStore.dispose();
    collaboratorStore.dispose();
  }

  @override
  List<Object> get props => [];
}
