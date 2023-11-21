import 'package:equatable/equatable.dart';

class CheckIfCollaboratorisTalkingEntity extends Equatable {
  final Stream<bool> collaboratorIsTalking;

  const CheckIfCollaboratorisTalkingEntity({
    required this.collaboratorIsTalking,
  });

  @override
  List<Object> get props => [
        collaboratorIsTalking,
      ];
}
