import 'package:nokhte_backend/tables/working_collaborative_documents.dart';

class DocContentResonse {
  static Stream<DocInfoContent> get successfulResponse => Stream.value(
        DocInfoContent(
          content: "content",
          lastEditor: LastEditedBy.user,
          collaboratorsCommitDesireStatus: true,
          documentCommitStatus: true,
          userCommitDesireStatus: true,
        ),
      );
  static Stream<DocInfoContent> get notSuccessfulResponse => Stream.value(
        DocInfoContent(
          content: "",
          lastEditor: LastEditedBy.initial,
          collaboratorsCommitDesireStatus: false,
          documentCommitStatus: false,
          userCommitDesireStatus: false,
        ),
      );
}
