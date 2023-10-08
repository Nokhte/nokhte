// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/mobx/main/get_direction_angle_store.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase6_coordinator_store.g.dart';

class P2PPurposePhase6CoordinatorStore = _P2PPurposePhase6CoordinatorStoreBase
    with _$P2PPurposePhase6CoordinatorStore;

abstract class _P2PPurposePhase6CoordinatorStoreBase extends Equatable
    with Store {
  final BeachHorizonTrackerStore beachWaves;
  final GetDirectionAngleStore gyroscopeStore;
  final BeachSkyStore beachSkyStore;

  @observable
  double direction = -10.0;

  screenConstructor() async {
    // beachWaves.initiateSuspendedAtTheDepths();
    // if (await Permission.locationWhenInUse.isDenied) {
    //   await Permission.locationWhenInUse.request();
    // }
    // await gyroscopeStore(NoParams());
    // gyroscopeStore.userDirection.listen((value) {
    //   print("is heading in the coordinator?? ${value.heading} ");
    //   setDirection(value.heading ?? -11.0);
    //   print("is the value being set??? ${direction} ");
    // });
  }

  @action
  setDirection(double newValue) {
    direction = newValue;
  }

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.beachWaves,
    required this.gyroscopeStore,
    required this.beachSkyStore,
  });

  @override
  List<Object> get props => [];
}
