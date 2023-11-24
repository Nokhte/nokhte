import 'package:equatable/equatable.dart';

class CollaboratorSearchAndEntryStatus extends Equatable {
  final bool hasEntered;
  final bool hasFoundTheirCollaborator;

  CollaboratorSearchAndEntryStatus({
    required this.hasEntered,
    required this.hasFoundTheirCollaborator,
  });

  @override
  List<Object> get props => [hasEntered, hasFoundTheirCollaborator];
}
