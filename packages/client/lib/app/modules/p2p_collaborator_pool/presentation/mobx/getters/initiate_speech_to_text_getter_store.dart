// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
// * Mobx Codegen Inclusion
part 'initiate_speech_to_text_getter_store.g.dart';

class InitiateSpeechToTextGetterStore = _InitiateSpeechToTextGetterStoreBase
    with _$InitiateSpeechToTextGetterStore;

abstract class _InitiateSpeechToTextGetterStoreBase extends Equatable
    with Store {
  final InitiateSpeechToText initSpeechLogic;

  _InitiateSpeechToTextGetterStoreBase({
    required this.initSpeechLogic,
  });

  Future<Either<Failure, SpeechToTextInitializerStatusEntity>> call() async =>
      await initSpeechLogic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
