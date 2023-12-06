import 'package:equatable/equatable.dart';

class ExistingCollaborationsInfoEntity extends Equatable {
  final bool hasACollaboration;
  final bool hasAPurpose;
  final bool hasDoneThePerspectivesSession;

  const ExistingCollaborationsInfoEntity({
    required this.hasACollaboration,
    required this.hasAPurpose,
    required this.hasDoneThePerspectivesSession,
  });

  @override
  List<Object> get props => [hasACollaboration, hasDoneThePerspectivesSession];
}
