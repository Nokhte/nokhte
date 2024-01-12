import 'package:equatable/equatable.dart';

class CollaboratorSearchAndEntryStatus extends Equatable {
  final bool hasFoundTheirCollaborator;

  CollaboratorSearchAndEntryStatus({
    required this.hasFoundTheirCollaborator,
  });

  @override
  List<Object> get props => [hasFoundTheirCollaborator];
}
