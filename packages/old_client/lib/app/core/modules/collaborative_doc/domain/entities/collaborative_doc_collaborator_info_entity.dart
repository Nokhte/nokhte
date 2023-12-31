import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';

class CollaborativeDocCollaboratorInfoEntity extends Equatable {
  final Stream<CollaboratorDocInfo> collaboratorDocInfo;
  const CollaborativeDocCollaboratorInfoEntity({
    required this.collaboratorDocInfo,
  });

  @override
  List<Object> get props => [collaboratorDocInfo];
}
