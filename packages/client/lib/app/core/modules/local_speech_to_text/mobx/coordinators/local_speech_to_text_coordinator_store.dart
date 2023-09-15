// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'local_speech_to_text_coordinator_store.g.dart';

class LocalSpeechToTextCoordinatorStore = _LocalSpeechToTextCoordinatorStoreBase
    with _$LocalSpeechToTextCoordinatorStore;

abstract class _LocalSpeechToTextCoordinatorStoreBase extends Equatable
    with Store {
  final InitLeopardStore initLeopardStore;
  final ProcessAudioStore processAudioStore;
  final StartRecordingStore startRecordingStore;
  final StopRecordingStore stopRecordingStore;

  _LocalSpeechToTextCoordinatorStoreBase({
    required this.initLeopardStore,
    required this.processAudioStore,
    required this.startRecordingStore,
    required this.stopRecordingStore,
  });
  @override
  List<Object> get props => [
// some items
      ];
}
