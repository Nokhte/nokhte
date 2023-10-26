import 'package:nokhte_backend/working_collaborative_documents.dart';

class DocContentResonse {
  static Stream<DocInfoContent> get successfulResponse => Stream.value(
        DocInfoContent(
          content: "content",
          lastEditedBy: "lastEditedBy",
          currentUserUID: "lastEditedBy",
          collaboratorsCommitDesireStatus: true,
          documentCommitStatus: true,
          userCommitDesireStatus: true,
        ),
      );
  static Stream<DocInfoContent> get notSuccessfulResponse => Stream.value(
        DocInfoContent(
          content: "",
          lastEditedBy: "",
          currentUserUID: "",
          collaboratorsCommitDesireStatus: false,
          documentCommitStatus: false,
          userCommitDesireStatus: false,
        ),
      );
}
