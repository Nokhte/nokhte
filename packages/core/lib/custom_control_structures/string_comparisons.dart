class StringComparison {
  static isCollaboratorTwo({
    required String input,
    required Function callback,
    required elseReturnVal,
  }) async {
    if (input == "collaborator_two") {
      return await callback();
    } else {
      return elseReturnVal;
    }
  }
}
