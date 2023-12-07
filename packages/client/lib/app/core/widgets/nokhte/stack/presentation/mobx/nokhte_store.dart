// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
// * Mobx Codegen Inclusion
part 'nokhte_store.g.dart';

class NokhteStore = _NokhteStoreBase with _$NokhteStore;

abstract class _NokhteStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @override
  List<Object> get props => [
// some items
      ];
}
