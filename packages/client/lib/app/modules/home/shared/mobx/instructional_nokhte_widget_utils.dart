import 'dart:ui';

import 'package:mobx/mobx.dart';

mixin InstructionalNokhteWidgetUtils {
  final _center = Observable(Offset.zero);

  Offset get center => _center.value;

  _setCenter(Offset value) => _center.value = value;

  Action actionSetCenter = Action(() {});

  initInstructionalNokhteUtils(Offset value) {
    actionSetCenter = Action(_setCenter);
    setCenter(value);
  }

  setCenter(Offset value) => actionSetCenter([value]);
}
