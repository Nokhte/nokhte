// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'speak_the_collaborator_phrase_coordinator_store.g.dart';

class SpeakTheCollaboratorPhraseCoordiantorStore = _SpeakTheCollaboratorPhraseCoordiantorStoreBase
    with _$SpeakTheCollaboratorPhraseCoordiantorStore;

abstract class _SpeakTheCollaboratorPhraseCoordiantorStoreBase extends Equatable
    with Store {
  CustomWidgetsTrackerStore widgetStore;
  SpeechToTextStore speechToTextStore;
  _SpeakTheCollaboratorPhraseCoordiantorStoreBase({
    required this.widgetStore,
    required this.speechToTextStore,
  });

  /// so what exactly are the functions we are going to
  /// want a level of abstraction for
  /// so firstly for the hold up and hold down start & hold down end
  /// so

  @action
  breathingPentagonsHoldStartCallback() {
    widgetStore.breathingPentagonsHoldCallback();
    speechToTextStore.startListening();
  }

  @action
  breathingPentagonsHoldEndCallback() {
    widgetStore.breathingPentagonsHoldCallback();
    speechToTextStore.stopListening();
  }

  /// so a few things are missing from this implementation
  /// the first is the initialization which I recommend
  /// have that worked into the widget itself like in the
  /// constructor or the onInit, secondly, you will want to
  /// // 0. inject this store into the screen
  /// // 1. Initialize call on the colalborator phrase screen
  /// 2. have a way to display new words =====> attack this when u get back
  ///     - So this has to do with the callback that we haven't addressed yet
  ///     - so what exactly should be the infrastructure we assume here
  /// maybe we can start with what infrastructure should be used, I think it
  /// should be a logic function so you can preserve the functional error
  /// handling approach we have been going for and that will be called in the
  /// remote source so let's make that,
  /// 3. have second and third takes if they want to re-record
  /// =======================================================
  /// one step at a time start with injecting this

  @override
  List<Object> get props => [
// some items
      ];
}
