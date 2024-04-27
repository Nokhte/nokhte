// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'session_seating_guide_store.g.dart';

class SessionSeatingGuideStore = _SessionSeatingGuideStoreBase
    with _$SessionSeatingGuideStore;

abstract class _SessionSeatingGuideStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  @observable
  ObservableList<int> values = ObservableList.of(List.filled(3, 3));

  @action
  setValues(List<int> values) => this.values = ObservableList.of(values);
}
