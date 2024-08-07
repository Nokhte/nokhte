import 'package:equatable/equatable.dart';

class StaticSessionMetadataEntity extends Equatable {
  final int userIndex;
  final bool isAPremiumSession;
  final bool leaderIsWhitelisted;
  final String leaderUID;
  final bool isAValidSession;
  final String presetUID;

  const StaticSessionMetadataEntity({
    required this.userIndex,
    required this.leaderUID,
    required this.isAPremiumSession,
    required this.leaderIsWhitelisted,
    this.isAValidSession = true,
    required this.presetUID,
  });

  @override
  List<Object> get props => [
        userIndex,
        isAPremiumSession,
        leaderUID,
        leaderIsWhitelisted,
        isAValidSession,
        presetUID,
      ];
}
