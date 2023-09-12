import 'package:primala_backend/working_collaborative_documents.dart';

class DocContentResonse {
  static Stream<DocInfoContent> get successfulResponse => Stream.value(
        DocInfoContent(
          content: "content",
          lastEditedBy: "lastEditedBy",
          currentUserUID: "lastEditedBy",
        ),
      );
  static Stream<DocInfoContent> get notSuccessfulResponse => Stream.value(
        DocInfoContent(
          content: "",
          lastEditedBy: "",
          currentUserUID: "",
        ),
      );
}
