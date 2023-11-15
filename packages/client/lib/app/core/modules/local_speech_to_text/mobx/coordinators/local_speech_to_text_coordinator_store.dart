// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
part 'local_speech_to_text_coordinator_store.g.dart';

class LocalSpeechToTextCoordinatorStore = _LocalSpeechToTextCoordinatorStoreBase
    with _$LocalSpeechToTextCoordinatorStore;

abstract class _LocalSpeechToTextCoordinatorStoreBase extends Equatable
    with Store {
  final InitLeopardStore initLeopardStore;
  final StartRecordingStore startRecordingStore;
  final StopRecordingStore stopRecordingStore;
  final OnSpeechResultStore onSpeechResultStore;

  _LocalSpeechToTextCoordinatorStoreBase({
    required this.initLeopardStore,
    required this.startRecordingStore,
    required this.stopRecordingStore,
    required this.onSpeechResultStore,
  });
  @override
  List<Object> get props => [];
}
