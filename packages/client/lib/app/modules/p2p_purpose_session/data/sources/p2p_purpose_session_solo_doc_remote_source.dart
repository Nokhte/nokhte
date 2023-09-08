abstract class P2PPurposeSessionSoloDocRemoteSource {
  Future<List> createSoloDoc();

  Future<List> getSoloDocContent();

  Future<List> sealSoloDoc();

  Future<List> shareSoloDoc();

  Future<List> submitDocContent({required String newContent});
}

//todo implement the rs impl