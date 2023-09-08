import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class InitiateSpeechToText
    extends AbstractFutureLogic<SpeechToTextInitializerStatusEntity, NoParams> {
  final P2PCollaboratorPoolContract contract;

  InitiateSpeechToText({required this.contract});

  @override
  Future<Either<Failure, SpeechToTextInitializerStatusEntity>> call(
          NoParams params) async =>
      await contract.initializeSpeechToText();
}
