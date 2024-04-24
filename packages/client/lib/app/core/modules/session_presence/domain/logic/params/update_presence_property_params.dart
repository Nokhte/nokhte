import 'package:equatable/equatable.dart';

class UpdatePresencePropertyParams extends Equatable {
  final bool shouldUpdateCollaboratorsIndex;
  final bool newStatus;

  const UpdatePresencePropertyParams({
    required this.newStatus,
    this.shouldUpdateCollaboratorsIndex = false,
  });

  factory UpdatePresencePropertyParams.userNegative() =>
      const UpdatePresencePropertyParams(
        newStatus: false,
      );

  factory UpdatePresencePropertyParams.userAffirmative() =>
      const UpdatePresencePropertyParams(
        newStatus: true,
      );

  factory UpdatePresencePropertyParams.collaboratorNegative() =>
      const UpdatePresencePropertyParams(
          newStatus: false, shouldUpdateCollaboratorsIndex: true);

  factory UpdatePresencePropertyParams.collaboratorAffirmative() =>
      const UpdatePresencePropertyParams(
          newStatus: true, shouldUpdateCollaboratorsIndex: true);

  @override
  List<Object> get props => [
        shouldUpdateCollaboratorsIndex,
        newStatus,
      ];
}
