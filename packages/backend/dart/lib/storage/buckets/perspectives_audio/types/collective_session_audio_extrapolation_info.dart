import 'package:equatable/equatable.dart';

class CollectiveSessionAudioExtrapolationInfo extends Equatable {
  final DateTime perspectivesCommitTimestamp;
  final Map individualSessionMetadata;
  final DateTime collectiveSessionTimestamp;
  final DateTime individualSessionTimestamp;
  CollectiveSessionAudioExtrapolationInfo({
    required this.perspectivesCommitTimestamp,
    required this.individualSessionMetadata,
    required this.collectiveSessionTimestamp,
    required this.individualSessionTimestamp,
  });

  @override
  List<Object> get props => [
        perspectivesCommitTimestamp,
        individualSessionMetadata,
        collectiveSessionTimestamp,
        individualSessionTimestamp,
      ];
}
