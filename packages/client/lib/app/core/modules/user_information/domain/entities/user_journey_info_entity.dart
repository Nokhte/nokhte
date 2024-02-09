import 'package:equatable/equatable.dart';

class UserJourneyInfoEntity extends Equatable {
  final bool hasGoneThroughInvitationFlow;
  final bool hasSentAnInvitation;
  final bool wantsToRepeatInvitationFlow;
  final List authorizedViewers;
  final String userUID;
  const UserJourneyInfoEntity({
    required this.hasGoneThroughInvitationFlow,
    required this.hasSentAnInvitation,
    required this.wantsToRepeatInvitationFlow,
    required this.userUID,
    required this.authorizedViewers,
  });

  factory UserJourneyInfoEntity.initial() => const UserJourneyInfoEntity(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
        userUID: "",
        authorizedViewers: [],
      );

  @override
  List<Object> get props => [
        hasGoneThroughInvitationFlow,
        hasSentAnInvitation,
        wantsToRepeatInvitationFlow,
        userUID,
        authorizedViewers,
      ];
}
