import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/working_perspectives_positioning.dart';

class WorkingPerspectivesStreamEntity extends Equatable {
  final Stream<PerspectivesPositioning> stream;

  const WorkingPerspectivesStreamEntity({
    required this.stream,
  });

  @override
  List<Object> get props => [stream];
}
