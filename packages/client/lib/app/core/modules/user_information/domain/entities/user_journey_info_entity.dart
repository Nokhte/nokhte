import 'package:equatable/equatable.dart';

class UserJourneyInfoEntity extends Equatable {
  final bool hasGoneThroughInvitationFlow;
  final bool hasSentAnInvitation;
  final bool wantsToRepeatInvitationFlow;
  final String userUID;
  const UserJourneyInfoEntity({
    required this.hasGoneThroughInvitationFlow,
    required this.hasSentAnInvitation,
    required this.wantsToRepeatInvitationFlow,
    required this.userUID,
  });

  factory UserJourneyInfoEntity.initial() => const UserJourneyInfoEntity(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
        userUID: "",
      );

  @override
  List<Object> get props => [hasGoneThroughInvitationFlow, hasSentAnInvitation];
}
