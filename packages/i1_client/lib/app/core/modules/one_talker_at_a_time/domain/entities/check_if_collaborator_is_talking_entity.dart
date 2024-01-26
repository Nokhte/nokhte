import 'package:equatable/equatable.dart';

class CheckIfCollaboratorIsTalkingEntity extends Equatable {
  final Stream<bool> collaboratorIsTalking;

  const CheckIfCollaboratorIsTalkingEntity({
    required this.collaboratorIsTalking,
  });

  @override
  List<Object> get props => [
        collaboratorIsTalking,
      ];
}
