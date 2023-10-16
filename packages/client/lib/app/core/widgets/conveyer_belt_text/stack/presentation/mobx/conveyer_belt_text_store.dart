// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/constants/movies/default_layout_movie.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'conveyer_belt_text_store.g.dart';

class ConveyerBeltTextStore = _ConveyerBeltTextStoreBase
    with _$ConveyerBeltTextStore;

abstract class _ConveyerBeltTextStoreBase extends Equatable with Store {
  DateOrTime currentFocus = DateOrTime.date;

  @observable
  MovieTween movie = DefaultLayoutMovie.movie;

  @observable
  Control control = Control.play;

  @observable
  List<String> uiArray = [];

  @observable
  ReturnDateOrTimeEntity returnEntity =
      const ReturnDateOrTimeEntity(dateOrTimeList: [], activeSelectionIndex: 0);

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
    setDatesArray();
    setUIArray(dates);
  }

  @action
  setDatesArray() {
    returnEntity = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: DateOrTime.date,
        currentTime: DateTime.now(),
      ),
    );
    dates = returnEntity.dateOrTimeList;
    setCurrentlySelectedIndex(returnEntity.activeSelectionIndex);
  }

  @action
  setTimesArray() {
    returnEntity = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: DateOrTime.time,
        currentTime: DateTime.now(),
      ),
    );
    times = returnEntity.dateOrTimeList;
    setCurrentlySelectedIndex(returnEntity.activeSelectionIndex);
  }

  @action
  setUIArray(List<GeneralDateTimeReturnType> inputArr) {
    // left
    final leftMostVal =
        leftMostIndex.isNegative ? "" : theFocusedList[leftMostIndex].formatted;
    final leftVal =
        leftIndex.isNegative ? "" : theFocusedList[leftIndex].formatted;
    // center
    final centerVal = focusListCardinalLength == 0
        ? ""
        : theFocusedList[currentlySelectedIndex].formatted;
    // right
    final rightVal = rightIndex > focusListCardinalLength
        ? ""
        : theFocusedList[rightIndex].formatted;
    final rightMostVal = rightMostIndex > focusListCardinalLength
        ? ""
        : theFocusedList[rightMostIndex].formatted;

    uiArray = [leftMostVal, leftVal, centerVal, rightVal, rightMostVal];
  }

  @computed
  List<GeneralDateTimeReturnType> get theFocusedList =>
      currentFocus == DateOrTime.date ? dates : times;

  @observable
  int currentlySelectedIndex = 0;

  @action
  setCurrentlySelectedIndex(int index) {
    // assert(index > 0 && index <= (dates.length - 1), "must be greater than 0");
    currentlySelectedIndex = index;
  }

  @override
  List<Object> get props => [];
}
