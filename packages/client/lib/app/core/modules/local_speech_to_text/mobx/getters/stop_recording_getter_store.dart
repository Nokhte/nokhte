// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'stop_recording_getter_store.g.dart';

class StopRecordingGetterStore = _StopRecordingGetterStoreBase
    with _$StopRecordingGetterStore;

abstract class _StopRecordingGetterStoreBase extends Equatable with Store {
  final StopRecording logic;

  _StopRecordingGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, RecordingStatusEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
