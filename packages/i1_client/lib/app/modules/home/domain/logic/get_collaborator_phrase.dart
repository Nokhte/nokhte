import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';

class GetCollaboratorPhrase
    extends AbstractFutureLogic<CollaboratorPhraseEntity, NoParams> {
  final HomeContract contract;

  GetCollaboratorPhrase({required this.contract});

  @override
  Future<Either<Failure, CollaboratorPhraseEntity>> call(
          NoParams params) async =>
      await contract.getCollaboratorPhrase(params);
}
