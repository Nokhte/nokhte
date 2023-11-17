import 'package:equatable/equatable.dart';

class DocInfoContent extends Equatable {
  final String content;
  final String currentUserUID;
  final String lastEditedBy;
  final bool collaboratorsCommitDesireStatus;
  final bool userCommitDesireStatus;
  final bool documentCommitStatus;

  DocInfoContent({
    required this.content,
    required this.lastEditedBy,
    required this.currentUserUID,
    required this.collaboratorsCommitDesireStatus,
    required this.documentCommitStatus,
    required this.userCommitDesireStatus,
  });

  @override
  List<Object> get props => [content, lastEditedBy];
}
