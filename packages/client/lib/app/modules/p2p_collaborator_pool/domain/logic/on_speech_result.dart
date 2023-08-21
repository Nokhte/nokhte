import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class OnSpeechResult
    extends AbstractFutureLogic<SpeechToTextResultEntity, NoParams> {
  final P2PCollaboratorPoolContract contract;

  OnSpeechResult({required this.contract});

  @override
  Future<Either<Failure, SpeechToTextResultEntity>> call(
          NoParams params) async =>
      await contract.onSpeechResult();
}
