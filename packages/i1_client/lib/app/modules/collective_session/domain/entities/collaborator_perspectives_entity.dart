import 'package:equatable/equatable.dart';
import 'package:nokhte/app/modules/collective_session/types/types.dart';

class CollaboratorPerspectivesEntity extends Equatable {
  final List<CollaboratorPerspectivesData> collaboratorPerspectivesData;

  const CollaboratorPerspectivesEntity({
    required this.collaboratorPerspectivesData,
  });

  @override
  List<Object> get props => [collaboratorPerspectivesData];
}
