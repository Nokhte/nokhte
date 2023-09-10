// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'unmute_local_audio_stream_getter_store.g.dart';

class UnmuteLocalAudioStreamGetterStore = _UnmuteLocalAudioStreamGetterStoreBase
    with _$UnmuteLocalAudioStreamGetterStore;

abstract class _UnmuteLocalAudioStreamGetterStoreBase extends Equatable
    with Store {
  UnmuteLocalAudioStream logic;

  _UnmuteLocalAudioStreamGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, LocalAudioStreamStatusEntity>> call() async =>
      await logic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
