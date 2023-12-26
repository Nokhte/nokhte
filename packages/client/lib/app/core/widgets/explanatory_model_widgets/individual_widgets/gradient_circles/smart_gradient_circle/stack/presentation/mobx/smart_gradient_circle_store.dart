// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'smart_gradient_circle_store.g.dart';

class SmartGradientCircleStore = _SmartGradientCircleStoreBase
    with _$SmartGradientCircleStore;

abstract class _SmartGradientCircleStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {}
