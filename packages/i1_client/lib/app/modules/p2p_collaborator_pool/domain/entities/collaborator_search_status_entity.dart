import 'package:equatable/equatable.dart';

class CollaboratorSearchStatusEntity extends Equatable {
  final Stream<bool> searchAndEntryStatusStream;

  const CollaboratorSearchStatusEntity(
      {required this.searchAndEntryStatusStream});

  @override
  List<Object> get props => [searchAndEntryStatusStream];
}
