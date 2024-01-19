import 'package:equatable/equatable.dart';

class UnconsecratedCollaborationCheckerEntity extends Equatable {
  final String collaboratorOneUID;
  final String collaboratorTwoUID;
  final bool hasOne;
  const UnconsecratedCollaborationCheckerEntity({
    required this.hasOne,
    required this.collaboratorOneUID,
    required this.collaboratorTwoUID,
  });

  factory UnconsecratedCollaborationCheckerEntity.initial() =>
      const UnconsecratedCollaborationCheckerEntity(
        collaboratorOneUID: '',
        collaboratorTwoUID: '',
        hasOne: false,
      );

  @override
  List<Object> get props => [collaboratorOneUID, collaboratorTwoUID, hasOne];
}
