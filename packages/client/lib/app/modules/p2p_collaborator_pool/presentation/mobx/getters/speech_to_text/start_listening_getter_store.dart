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
part 'start_listening_getter_store.g.dart';

class StartListeningGetterStore = _StartListeningGetterStoreBase
    with _$StartListeningGetterStore;

abstract class _StartListeningGetterStoreBase extends Equatable with Store {
  final StartListening startListeningLogic;

  _StartListeningGetterStoreBase({
    required this.startListeningLogic,
  });

  Future<Either<Failure, ListeningStatusEntity>> call() async =>
      await startListeningLogic(
        NoParams(),
      );

  @override
  List<Object> get props => [
// some items
      ];
}
