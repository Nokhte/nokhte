import 'package:equatable/equatable.dart';

class CollaborativeDocCollaboratorDeltaEntity extends Equatable {
  final Stream<int> delta;

  const CollaborativeDocCollaboratorDeltaEntity({required this.delta});

  @override
  List<Object> get props => [delta];
}
