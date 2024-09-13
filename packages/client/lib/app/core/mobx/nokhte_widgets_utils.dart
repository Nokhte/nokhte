import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

mixin NokhteWidgetsUtils {
  CenterNokhteStore get centerNokhte;
  List<AuxiliaryNokhteStore> get auxNokhtes;
  final _hasInitiatedBlur = Observable(false);

  bool isAllowedToMakeGesture() =>
      centerNokhte.movieStatus != MovieStatus.inProgress &&
      auxNokhtes
          .every((element) => element.movieStatus != MovieStatus.inProgress);

  bool get hasInitiatedBlur => _hasInitiatedBlur.value;

  _setHasInitiatedBlur(bool value) => _hasInitiatedBlur.value = value;

  Action actionSetHasInitiatedBlur = Action(() {});

  initNokhteWidgetsUtils() {
    actionSetHasInitiatedBlur = Action(_setHasInitiatedBlur);
  }

  setHasInitiatedBlur(bool value) {
    actionSetHasInitiatedBlur([value]);
  }
}
