import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';

class ExistingCollaborationsInfoEntity extends Equatable {
  final bool hasACollaboration;
  final bool hasAPurpose;
  final bool hasDoneThePerspectivesSession;

  const ExistingCollaborationsInfoEntity({
    required this.hasACollaboration,
    required this.hasAPurpose,
    required this.hasDoneThePerspectivesSession,
  });

  static Either<Failure, ExistingCollaborationsInfoEntity> get initial =>
      const Right(
        ExistingCollaborationsInfoEntity(
          hasAPurpose: false,
          hasACollaboration: false,
          hasDoneThePerspectivesSession: false,
        ),
      );

  @override
  List<Object> get props => [hasACollaboration, hasDoneThePerspectivesSession];
}
