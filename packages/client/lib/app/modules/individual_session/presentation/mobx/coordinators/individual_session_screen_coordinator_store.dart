// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'individual_session_screen_coordinator_store.g.dart';

class IndividualSessionScreenCoordinatorStore = _IndividualSessionScreenCoordinatorStoreBase
    with _$IndividualSessionScreenCoordinatorStore;

abstract class _IndividualSessionScreenCoordinatorStoreBase extends Equatable
    with Store {
  final GetCurrentPerspectivesStore getCurrentPerspectives;

  _IndividualSessionScreenCoordinatorStoreBase({
    required this.getCurrentPerspectives,
  });

  @action
  screenConstructor() async {
    await getCurrentPerspectives(NoParams());
  }

  @override
  List<Object> get props => [];
}
