import 'package:nokhte_core/types/types.dart';

class StringComparison {
  static isCollaborator({
    required CollaboratorOptions collaboratorOptions,
    required String input,
    required Function callback,
    required elseReturnVal,
  }) async {
    switch (collaboratorOptions) {
      case CollaboratorOptions.one:
        executeCallbackIfStringEquals(
            callback, input, "collaborator_one", elseReturnVal);
      case CollaboratorOptions.two:
        executeCallbackIfStringEquals(
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
      await callback();
    } else {
      return elseReturnVal;
    }
  }
}
