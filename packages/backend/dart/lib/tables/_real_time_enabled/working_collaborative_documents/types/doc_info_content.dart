import 'package:equatable/equatable.dart';

class DocInfoContent extends Equatable {
  final bool lastEditWasTheUser;
  final String content;
  final bool collaboratorsCommitDesireStatus;
  final bool userCommitDesireStatus;
  final bool documentCommitStatus;

  DocInfoContent({
    required this.content,
    required this.lastEditWasTheUser,
    required this.collaboratorsCommitDesireStatus,
    required this.documentCommitStatus,
    required this.userCommitDesireStatus,
  });

  @override
  List<Object> get props => [
        content,
        lastEditWasTheUser,
        collaboratorsCommitDesireStatus,
        documentCommitStatus,
        userCommitDesireStatus,
      ];
}
