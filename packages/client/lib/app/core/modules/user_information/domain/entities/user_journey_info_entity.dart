import 'package:equatable/equatable.dart';

class UserJourneyInfoEntity extends Equatable {
  final bool hasGoneThroughInvitationFlow;
  final bool hasSentAnInvitation;
  final bool wantsToRepeatInvitationFlow;
  final bool hasCompletedNoktheSession;
  final String userUID;
  const UserJourneyInfoEntity({
    required this.hasGoneThroughInvitationFlow,
    required this.hasSentAnInvitation,
    required this.wantsToRepeatInvitationFlow,
    required this.userUID,
    required this.hasCompletedNoktheSession,
  });

  factory UserJourneyInfoEntity.initial() => const UserJourneyInfoEntity(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
        userUID: "",
        hasCompletedNoktheSession: false,
      );

  @override
  List<Object> get props => [
        hasGoneThroughInvitationFlow,
        hasSentAnInvitation,
        wantsToRepeatInvitationFlow,
        hasCompletedNoktheSession,
        userUID,
      ];
}
