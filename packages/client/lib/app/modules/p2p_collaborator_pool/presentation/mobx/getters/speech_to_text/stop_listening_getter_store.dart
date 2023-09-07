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
part 'stop_listening_getter_store.g.dart';

class StopListeningGetterStore = _StopListeningGetterStoreBase
    with _$StopListeningGetterStore;

abstract class _StopListeningGetterStoreBase extends Equatable with Store {
  final StopListening stopListeningLogic;

  _StopListeningGetterStoreBase({
    required this.stopListeningLogic,
  });

  Future<Either<Failure, ListeningStatusEntity>> call() async =>
      await stopListeningLogic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
