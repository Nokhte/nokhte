import 'package:nokhte_backend/tables/working_collaborative_documents.dart';

class DocContentResonse {
  static Stream<DocInfoContent> get successfulResponse => Stream.value(
        DocInfoContent(
          content: "content",
          lastEditWasTheUser: true,
          collaboratorsCommitDesireStatus: true,
          documentCommitStatus: true,
          userCommitDesireStatus: true,
        ),
      );
  static Stream<DocInfoContent> get notSuccessfulResponse => Stream.value(
        DocInfoContent(
          content: "",
          lastEditWasTheUser: false,
          collaboratorsCommitDesireStatus: false,
          documentCommitStatus: false,
          userCommitDesireStatus: false,
        ),
      );
}
