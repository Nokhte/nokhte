// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'dumb_gradient_circle_store.g.dart';

class DumbGradientCircleStore = _DumbGradientCircleStoreBase
    with _$DumbGradientCircleStore;

abstract class _DumbGradientCircleStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {}
