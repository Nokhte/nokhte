// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
part 'local_speech_to_text_coordinator.g.dart';

class LocalSpeechToTextCoordinator = _LocalSpeechToTextCoordinatorBase
    with _$LocalSpeechToTextCoordinator;

abstract class _LocalSpeechToTextCoordinatorBase extends Equatable with Store {
  final InitLeopardStore initLeopardStore;
  final StartRecordingStore startRecordingStore;
  final StopRecordingStore stopRecordingStore;
  final OnSpeechResultStore onSpeechResultStore;

  _LocalSpeechToTextCoordinatorBase({
    required this.initLeopardStore,
    required this.startRecordingStore,
    required this.stopRecordingStore,
    required this.onSpeechResultStore,
  });
  @override
  List<Object> get props => [];
}
