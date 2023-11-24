import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class CollaboratorSearchStatusEntity extends Equatable {
  final Stream<CollaboratorSearchAndEntryStatus> searchAndEntryStatusStream;

  const CollaboratorSearchStatusEntity(
      {required this.searchAndEntryStatusStream});

  @override
  List<Object> get props => [searchAndEntryStatusStream];
}
