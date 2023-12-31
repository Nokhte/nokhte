import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';

class ValidateQuery extends AbstractFutureLogic<
    CollaboratorPhraseValidationEntity, ValidateQueryParams> {
  final P2PCollaboratorPoolContract contract;

  ValidateQuery({required this.contract});

  @override
  Future<Either<Failure, CollaboratorPhraseValidationEntity>> call(
          params) async =>
      await contract.validateQuery(params.query);
}

class ValidateQueryParams extends Equatable {
  final String query;
  const ValidateQueryParams({required this.query});

  @override
  List<Object> get props => [query];
}
