import 'package:equatable/equatable.dart';

class CurrentPerspectivesEntity extends Equatable {
  final List currentPerspectives;
  final DateTime currentPerspectiveTimestamp;

  const CurrentPerspectivesEntity({
    required this.currentPerspectives,
    required this.currentPerspectiveTimestamp,
  });

  @override
  List<Object> get props => [currentPerspectives];
}
