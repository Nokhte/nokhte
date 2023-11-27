import 'package:nokhte_core/types/types.dart';

class StringComparison {
  static isCollaborator({
    required CollaboratorNumbers chosenCollaboratorNumber,
    required String input,
    required Function callback,
    required elseReturnVal,
  }) async {
    switch (chosenCollaboratorNumber) {
      case CollaboratorNumbers.one:
        return executeCallbackIfStringEquals(
            callback, input, "collaborator_one", elseReturnVal);
      case CollaboratorNumbers.two:
        return executeCallbackIfStringEquals(
            callback, input, "collaborator_two", elseReturnVal);
    }
  }

  static executeCallbackIfStringEquals(
    Function callback,
    String input,
    String comparisonString,
    elseReturnVal,
  ) async {
    if (input == comparisonString) {
      return await callback();
    } else {
      return elseReturnVal;
    }
  }
}
