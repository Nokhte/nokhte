// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
part 'start_recording_getter_store.g.dart';

class StartRecordingGetterStore = _StartRecordingGetterStoreBase
    with _$StartRecordingGetterStore;

abstract class _StartRecordingGetterStoreBase extends Equatable with Store {
  final StartRecording logic;

  _StartRecordingGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, SpeechToTextRecordingStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
