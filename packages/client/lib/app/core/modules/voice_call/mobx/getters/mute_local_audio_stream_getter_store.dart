// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'mute_local_audio_stream_getter_store.g.dart';

class MuteLocalAudioStreamGetterStore = _MuteLocalAudioStreamGetterStoreBase
    with _$MuteLocalAudioStreamGetterStore;

abstract class _MuteLocalAudioStreamGetterStoreBase extends Equatable
    with Store {
  MuteLocalAudioStream logic;

  _MuteLocalAudioStreamGetterStoreBase({required this.logic});

  Future<Either<Failure, LocalAudioStreamStatusEntity>> call() async =>
      await logic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
