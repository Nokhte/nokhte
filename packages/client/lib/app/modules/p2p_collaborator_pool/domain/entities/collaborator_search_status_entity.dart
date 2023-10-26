import 'package:equatable/equatable.dart';

class CollaboratorSearchStatusEntity extends Equatable {
  final Stream<bool> isFound;

  const CollaboratorSearchStatusEntity({required this.isFound});

  @override
  List<Object> get props => [isFound];
}
