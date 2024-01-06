import 'package:equatable/equatable.dart';

class UserJourneyInfoEntity extends Equatable {
  final bool hasGoneThroughInvitationFlow;
  final bool hasSentAnInvitation;
  final bool wantsToRepeatInvitationFlow;
  const UserJourneyInfoEntity({
    required this.hasGoneThroughInvitationFlow,
    required this.hasSentAnInvitation,
    required this.wantsToRepeatInvitationFlow,
  });

  static UserJourneyInfoEntity get initial => const UserJourneyInfoEntity(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
      );

  @override
  List<Object> get props => [hasGoneThroughInvitationFlow, hasSentAnInvitation];
}
