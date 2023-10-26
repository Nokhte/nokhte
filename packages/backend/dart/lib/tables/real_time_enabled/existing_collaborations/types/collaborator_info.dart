import 'package:equatable/equatable.dart';

class CollaboratorInfo extends Equatable {
  final String theUsersUID;
  final String theUsersCollaboratorNumber;
  final String theCollaboratorsUID;
  final String theCollaboratorsNumber;

  CollaboratorInfo({
    required this.theCollaboratorsNumber,
    required this.theCollaboratorsUID,
    required this.theUsersCollaboratorNumber,
    required this.theUsersUID,
  });

  @override
  List<Object> get props => [
        theCollaboratorsNumber,
        theCollaboratorsUID,
        theUsersCollaboratorNumber,
        theUsersUID,
      ];
}
