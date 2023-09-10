import 'package:equatable/equatable.dart';

class CollaborativeDocCollaboratorPresenceEntity extends Equatable {
  final Stream<bool> isPresent;

  const CollaborativeDocCollaboratorPresenceEntity({required this.isPresent});

  @override
  List<Object> get props => [isPresent];
}
