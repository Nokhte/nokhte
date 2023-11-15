import 'package:equatable/equatable.dart';

class ExistingCollaborationsInfoEntity extends Equatable {
  final bool hasACollaboration;
  final bool hasDoneThePerspectivesSession;

  const ExistingCollaborationsInfoEntity({
    required this.hasACollaboration,
    required this.hasDoneThePerspectivesSession,
  });

  @override
  List<Object> get props => [hasACollaboration, hasDoneThePerspectivesSession];
}
