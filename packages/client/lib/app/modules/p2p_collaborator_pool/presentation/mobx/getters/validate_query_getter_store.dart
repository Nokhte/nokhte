// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
// * Mobx Codegen Inclusion
part 'validate_query_getter_store.g.dart';

class ValidateQueryGetterStore = _ValidateQueryGetterStoreBase
    with _$ValidateQueryGetterStore;

abstract class _ValidateQueryGetterStoreBase extends Equatable with Store {
  ValidateQuery validateQueryLogic;

  _ValidateQueryGetterStoreBase({
    required this.validateQueryLogic,
  });

  Future<Either<Failure, CollaboratorPhraseValidationEntity>> call(
          ValidateQueryParams params) async =>
      await validateQueryLogic(
        ValidateQueryParams(
          query: params.query,
        ),
      );

  @override
  List<Object> get props => [
// some items
      ];
}
