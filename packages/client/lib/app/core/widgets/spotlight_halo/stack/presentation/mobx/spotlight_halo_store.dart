// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
part 'spotlight_halo_store.g.dart';

class SpotlightHaloStore = _SpotlightHaloStoreBase with _$SpotlightHaloStore;

abstract class _SpotlightHaloStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {}
