import 'package:equatable/equatable.dart';

class SessionMetadata extends Equatable {
  final List<String> thePerspectives;
  final List<int> numberOfFiles;

  const SessionMetadata({
    required this.numberOfFiles,
    required this.thePerspectives,
  });

  Map toJson() {
    final res = {"metadata": []};
    for (int i = 0; i < thePerspectives.length; i++) {
      res["metadata"]?.add({
        "thePerspective": thePerspectives[i],
        "numberOfFiles": numberOfFiles[i],
      });
    }
    return res;
  }

  @override
  List<Object> get props => [numberOfFiles, thePerspectives];
}
