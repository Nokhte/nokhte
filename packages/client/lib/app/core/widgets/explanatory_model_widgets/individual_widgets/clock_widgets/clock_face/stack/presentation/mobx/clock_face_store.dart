// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
part 'clock_face_store.g.dart';

class ClockFaceStore = _ClockFaceStoreBase with _$ClockFaceStore;

abstract class _ClockFaceStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {}
