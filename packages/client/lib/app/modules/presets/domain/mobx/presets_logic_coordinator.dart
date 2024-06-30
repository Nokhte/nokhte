// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
part 'presets_logic_coordinator.g.dart';

class PresetsLogicCoordinator = _PresetsLogicCoordinatorBase
    with _$PresetsLogicCoordinator;

abstract class _PresetsLogicCoordinatorBase with Store, BaseMobxLogic {
  final GetCompanyPresets getCompanyPresetsLogic;

  _PresetsLogicCoordinatorBase({
    required this.getCompanyPresetsLogic,
  }) {
    initBaseLogicActions();
  }

  @observable
  ObservableList unifiedUIDs = ObservableList();

  @observable
  ObservableList tags = ObservableList();

  @observable
  ObservableList names = ObservableList();

  @action
  getCompanyPresets() async {
    final result = await getCompanyPresetsLogic(NoParams());
    result.fold((failure) => errorUpdater(failure), (entity) {
      unifiedUIDs = ObservableList.of(entity.unifiedUIDs);
      tags = ObservableList.of(entity.tags);
      names = ObservableList.of(entity.names);
    });
  }
}
