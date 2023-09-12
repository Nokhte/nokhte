import 'package:equatable/equatable.dart';

class DocInfoContent extends Equatable {
  final String content;
  final String currentUserUID;
  final String lastEditedBy;

  DocInfoContent({
    required this.content,
    required this.lastEditedBy,
    required this.currentUserUID,
  });

  @override
  List<Object> get props => [content, lastEditedBy];
}
