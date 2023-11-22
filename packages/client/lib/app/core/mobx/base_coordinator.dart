// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'base_coordinator.g.dart';

class BaseCoordinator = _BaseCoordinatorBase with _$BaseCoordinator;

abstract class _BaseCoordinatorBase extends Equatable with Store {
  final BeachWavesTrackerStore beachWaves;

  _BaseCoordinatorBase({
    required this.beachWaves,
  });

  delayedNavigation(Function callback) {
    Future.delayed(
      beachWaves.movie.duration,
      () => callback(),
    );
  }

  @override
  List<Object> get props => [];
}
