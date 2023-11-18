class StringComparison {
  static isCollaboratorOne({
    required String input,
    required Function callback,
    required elseReturnVal,
  }) async {
    if (input == "collaborator_one") {
      await callback();
    } else {
      return elseReturnVal;
    }
  }
}
