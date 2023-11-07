// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'create_individual_session_getter_store.g.dart';

class CreateIndividualSessionGetterStore = _CreateIndividualSessionGetterStoreBase
    with _$CreateIndividualSessionGetterStore;

abstract class _CreateIndividualSessionGetterStoreBase extends Equatable
    with Store {
  final CreateIndividualSession logic;

  _CreateIndividualSessionGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, IndividualSessionCreationStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
