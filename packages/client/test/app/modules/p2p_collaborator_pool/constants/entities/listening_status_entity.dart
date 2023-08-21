import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantListeningStatusEntity {
  static ListeningStatusEntity get successCase =>
      const ListeningStatusEntity(isListening: true);
  static ListeningStatusEntity get notSuccessCase =>
      const ListeningStatusEntity(isListening: false);
  static Either<Failure, ListeningStatusEntity> get wrappedSuccessCase =>
      const Right(ListeningStatusEntity(isListening: true));
  static Either<Failure, ListeningStatusEntity> get wrappedNotSuccessCase =>
      const Right(ListeningStatusEntity(isListening: false));
}
