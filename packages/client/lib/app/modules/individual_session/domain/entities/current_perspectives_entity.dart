import 'package:equatable/equatable.dart';

class CurrentPerspectivesEntity extends Equatable {
  final List<String> currentPerspectives;

  const CurrentPerspectivesEntity({
    required this.currentPerspectives,
  });

  @override
  List<Object> get props => [currentPerspectives];
}
