abstract class OneTalkerAtATimeRemoteSource {
  Future<List> setUserAsCurrentTalker();
  Future<void> clearTheCurrentTalker();
  Stream<bool> checkIfCollaboratorIsTalking();
}
