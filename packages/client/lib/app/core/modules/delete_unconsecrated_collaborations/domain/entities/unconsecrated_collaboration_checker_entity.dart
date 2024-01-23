import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class UnconsecratedCollaborationCheckerEntity extends Equatable {
  final CollaboratorInfo collaboratorInfo;
  final bool hasOne;
  const UnconsecratedCollaborationCheckerEntity({
    required this.hasOne,
    required this.collaboratorInfo,
  });

  factory UnconsecratedCollaborationCheckerEntity.initial() =>
      UnconsecratedCollaborationCheckerEntity(
        collaboratorInfo: CollaboratorInfo.initial(),
        hasOne: false,
      );

  @override
  List<Object> get props => [collaboratorInfo, hasOne];
}
