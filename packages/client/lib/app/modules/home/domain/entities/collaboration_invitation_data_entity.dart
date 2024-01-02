import 'package:equatable/equatable.dart';

class CollaborationInvitationDataEntity extends Equatable {
  final String link;

  const CollaborationInvitationDataEntity({
    required this.link,
  });

  static CollaborationInvitationDataEntity get initial =>
      const CollaborationInvitationDataEntity(link: '');

  @override
  List<Object> get props => [link];
}
