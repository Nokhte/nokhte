// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'process_audio_getter_store.g.dart';

class ProcessAudioGetterStore = _ProcessAudioGetterStoreBase
    with _$ProcessAudioGetterStore;

abstract class _ProcessAudioGetterStoreBase extends Equatable with Store {
  final ProcessAudio logic;

  _ProcessAudioGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, AudioProcessingEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
