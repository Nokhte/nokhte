import 'package:equatable/equatable.dart';

class CurrentPerspectivesEntity extends Equatable {
  final String theUsersUID;
  final List currentPerspectives;
  final DateTime currentPerspectiveTimestamp;

  const CurrentPerspectivesEntity({
    required this.currentPerspectives,
    required this.currentPerspectiveTimestamp,
    required this.theUsersUID,
  });

  @override
  List<Object> get props => [currentPerspectives];
}
