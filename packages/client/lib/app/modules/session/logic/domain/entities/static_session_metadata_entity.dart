import 'package:equatable/equatable.dart';

class StaticSessionMetadataEntity extends Equatable {
  final int userIndex;
  final bool isAPremiumSession;
  final bool leaderIsWhitelisted;
  final bool isAValidSession;
  final String presetUID;

  const StaticSessionMetadataEntity({
    required this.userIndex,
    required this.isAPremiumSession,
    required this.leaderIsWhitelisted,
    required this.isAValidSession,
    required this.presetUID,
  });

  @override
  List<Object> get props => [
        userIndex,
        isAPremiumSession,
        leaderIsWhitelisted,
        isAValidSession,
        presetUID,
      ];
}
