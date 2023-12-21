// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'gradient_circle_store.g.dart';

class GradientCircleStore = _GradientCircleStoreBase with _$GradientCircleStore;

abstract class _GradientCircleStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {}
