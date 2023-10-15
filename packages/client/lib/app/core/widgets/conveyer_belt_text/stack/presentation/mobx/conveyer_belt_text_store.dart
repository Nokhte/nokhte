// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'conveyer_belt_text_store.g.dart';

class ConveyerBeltTextStore = _ConveyerBeltTextStoreBase
    with _$ConveyerBeltTextStore;

abstract class _ConveyerBeltTextStoreBase extends Equatable with Store {
  static final List<String> dates = ["Oct 15", "Oct 16", "Oct 17", "Oct 18"];

  @computed
  String get leftMostValue =>
      currentlySelectedIndex - 2 < 0 ? "" : dates[currentlySelectedIndex - 2];

  @computed
  String get leftValue =>
      currentlySelectedIndex - 1 < 0 ? "" : dates[currentlySelectedIndex - 1];

  @computed
  String get centerValue => dates[currentlySelectedIndex];

  @computed
  String get rightValue => currentlySelectedIndex + 1 > (dates.length - 1)
      ? ""
      : dates[currentlySelectedIndex + 1];

  @computed
  String get rightMostValue => currentlySelectedIndex + 2 > (dates.length - 1)
      ? ""
      : dates[currentlySelectedIndex + 2];

  @observable
  int currentlySelectedIndex = 0;

  @observable
  ObservableList<String> uiDates = ObservableList.of([]);

  @action
  setCurrentlySelectedIndex(int index) {
    assert(index > 0 && index <= dates.length - 1, "must be greater than 0");
    currentlySelectedIndex = index;
  }

  @override
  List<Object> get props => [];
}
