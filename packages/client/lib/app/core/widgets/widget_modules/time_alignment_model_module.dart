import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TimeAlignmentModelModule extends Module {
  @override
  List<Module> get imports => [
        ConnectivityModule(),
      ];
  @override
  void exportedBinds(i) {
    i.addSingleton<ClockFaceStore>(
      () => ClockFaceStore(),
    );
    i.add<AvailabilitySectorsStore>(
      () => AvailabilitySectorsStore(
        connectivity: Modular.get<GetOnConnectivityChangedStore>(),
      ),
    );
    i.add<TimeAlignmentModelCoordinator>(
      () => TimeAlignmentModelCoordinator(
        availabilitySectors: i<AvailabilitySectorsStore>(),
        clockFace: i<ClockFaceStore>(),
      ),
    );
  }
}
