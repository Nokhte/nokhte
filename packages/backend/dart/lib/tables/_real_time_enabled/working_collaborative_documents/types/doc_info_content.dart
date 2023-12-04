import 'package:equatable/equatable.dart';
import 'last_edited_by.dart';

class DocInfoContent extends Equatable {
  final LastEditedBy lastEditor;
  final String content;
  final bool collaboratorsCommitDesireStatus;
  final bool userCommitDesireStatus;
  final bool documentCommitStatus;

  DocInfoContent({
    required this.content,
    required this.lastEditor,
    required this.collaboratorsCommitDesireStatus,
    required this.documentCommitStatus,
    required this.userCommitDesireStatus,
  });

  @override
  List<Object> get props => [
        content,
        lastEditor,
        collaboratorsCommitDesireStatus,
        documentCommitStatus,
        userCommitDesireStatus,
      ];
}
