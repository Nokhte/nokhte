import 'package:equatable/equatable.dart';

class UpdatePresencePropertyParams extends Equatable {
  final bool newStatus;

  const UpdatePresencePropertyParams({
    required this.newStatus,
  });

  factory UpdatePresencePropertyParams.userNegative() =>
      const UpdatePresencePropertyParams(
        newStatus: false,
      );

  factory UpdatePresencePropertyParams.userAffirmative() =>
      const UpdatePresencePropertyParams(newStatus: true);

  @override
  List<Object> get props => [newStatus];
}
