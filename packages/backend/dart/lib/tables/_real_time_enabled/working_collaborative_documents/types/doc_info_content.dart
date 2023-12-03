import 'package:equatable/equatable.dart';

class DocInfoContent extends Equatable {
  final bool lastEditWasTheUser;
  final String usersContent;
  final String collaboratorsContent;
  final bool collaboratorsCommitDesireStatus;
  final bool userCommitDesireStatus;
  final bool documentCommitStatus;

  DocInfoContent({
    required this.usersContent,
    required this.collaboratorsContent,
    required this.lastEditWasTheUser,
    required this.collaboratorsCommitDesireStatus,
    required this.documentCommitStatus,
    required this.userCommitDesireStatus,
  });

  @override
  List<Object> get props => [];
}
