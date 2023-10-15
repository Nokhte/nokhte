// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/presentation/logic/return_date_or_time_array.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'conveyer_belt_text_store.g.dart';

class ConveyerBeltTextStore = _ConveyerBeltTextStoreBase
    with _$ConveyerBeltTextStore;

abstract class _ConveyerBeltTextStoreBase extends Equatable with Store {
  DateOrTime currentFocus = DateOrTime.date;

  @action
  toggleListFocus() => currentFocus == DateOrTime.date
      ? currentFocus = DateOrTime.time
      : DateOrTime.date;

  List<GeneralDateTimeReturnType> dates = [];

  List<GeneralDateTimeReturnType> times = [];

  final ReturnDateOrTimeArray logic;

  _ConveyerBeltTextStoreBase({
    required this.logic,
    required DateOrTime dateOrTimeParam,
  }) {
    dates = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: dateOrTimeParam,
        currentTime: DateTime.now(),
      ),
    );
    // print("${uiArray.toString()} LISTS??");
  }

  @action
  setTimesArray() {
    times = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: DateOrTime.time,
        currentTime: DateTime.now(),
      ),
    );
  }

  @computed
  int get leftMostIndex => currentlySelectedIndex - 2;

  @computed
  int get leftIndex => currentlySelectedIndex - 1;

  @computed
  int get rightIndex => currentlySelectedIndex + 1;

  @computed
  int get rightMostIndex => currentlySelectedIndex + 2;

  @computed
  int get focusListCardinalLength => theFocusedList.length - 1;

  @computed
  List<GeneralDateTimeReturnType> get theFocusedList =>
      currentFocus == DateOrTime.date ? dates : times;

  @computed
  String get leftMostValue => currentlySelectedIndex - 2 < 0
      ? ""
      : theFocusedList[leftMostIndex].formatted;

  @computed
  String get leftValue =>
      currentlySelectedIndex - 1 < 0 ? "" : theFocusedList[leftIndex].formatted;

  @computed
  String get centerValue => currentlySelectedIndex > focusListCardinalLength
      ? ""
      : theFocusedList[currentlySelectedIndex].formatted;

  @computed
  String get rightValue => rightIndex > (focusListCardinalLength)
      ? ""
      : theFocusedList[rightIndex].formatted;

  @computed
  String get rightMostValue => rightMostIndex > (focusListCardinalLength)
      ? ""
      : theFocusedList[rightMostIndex].formatted;

  @observable
  int currentlySelectedIndex = 0;

  @action
  setCurrentlySelectedIndex(int index) {
    assert(index > 0 && index <= (dates.length - 1), "must be greater than 0");
    currentlySelectedIndex = index;
  }

  @override
  List<Object> get props => [];
}
