// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/widgets/text_editor/mobx.dart';
// * Mobx Codegen Inclusion
part 'collaborator_text_editor_tracker_store.g.dart';

class CollaboratorTextEditorTrackerStore = _CollaboratorTextEditorTrackerStoreBase
    with _$CollaboratorTextEditorTrackerStore;

abstract class _CollaboratorTextEditorTrackerStoreBase
    extends BaseTextEditorStore with Store {}
