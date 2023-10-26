import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/working_collaborative_documents.dart';

class CollaborativeDocContentEntity extends Equatable {
  final Stream<DocInfoContent> docContent;

  const CollaborativeDocContentEntity({required this.docContent});

  @override
  List<Object> get props => [docContent];
}
