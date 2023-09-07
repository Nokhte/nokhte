import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantListeningStatusModel {
  static ListeningStatusModel get successCase =>
      const ListeningStatusModel(isListening: true);
  static ListeningStatusModel get notSuccessCase =>
      const ListeningStatusModel(isListening: false);
  static Either<Failure, ListeningStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, ListeningStatusModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
