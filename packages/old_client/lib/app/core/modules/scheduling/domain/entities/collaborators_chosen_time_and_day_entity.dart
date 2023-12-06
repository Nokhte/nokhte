import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';

class CollaboratorsChosenTimeAndDayEntity extends Equatable {
  final Stream<CollaboratorsDateAndTime> dateAndTime;

  const CollaboratorsChosenTimeAndDayEntity({
    required this.dateAndTime,
  });

  @override
  List<Object> get props => [dateAndTime];
}
