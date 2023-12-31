// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/conveyer_belt_text/stack/constants/movies/movies.dart';
import 'package:nokhte/app/core/widgets/conveyer_belt_text/stack/constants/types/conveyer_movie_modes.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'conveyer_belt_text_store.g.dart';

class ConveyerBeltTextStore = _ConveyerBeltTextStoreBase
    with _$ConveyerBeltTextStore;

abstract class _ConveyerBeltTextStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _ConveyerBeltTextStoreBase({
    required this.logic,
    required DateOrTime dateOrTimeParam,
  }) {
    setDatesArray(DateTime.now());
    setUIArray(dates);
    showWidget = false;
    movie = DefaultLayoutMovie.movie;
  }

  @action
  void setWidgetVisibility(bool newVisiblity) => showWidget = newVisiblity;

  @observable
  DateOrTime currentFocus = DateOrTime.date;

  @observable
  ConveyerMovieModes movieMode = ConveyerMovieModes.idleInRange;

  @observable
  List<UIArray> uiArray = [];

  @observable
  ReturnDateOrTimeEntity returnEntity =
      const ReturnDateOrTimeEntity(dateOrTimeList: [], activeSelectionIndex: 0);

  @computed
  int get leftMostIndex => currentlySelectedIndex - 2;

  @computed
  bool get leftMostCompOperator => leftMostIndex.isNegative;

  @computed
  int get leftIndex => currentlySelectedIndex - 1;

  @computed
  bool get leftCompOperator => leftIndex.isNegative;

  @computed
  bool get centerCompOperator => focusListCardinalLength == 0;

  @computed
  int get rightIndex => currentlySelectedIndex + 1;

  @computed
  bool get rightCompOperator => rightIndex > focusListCardinalLength;

  @computed
  int get rightMostIndex => currentlySelectedIndex + 2;

  @computed
  bool get rightMostCompOperator => rightMostIndex > focusListCardinalLength;

  @computed
  List<bool> get comparisonList => [
        leftMostCompOperator,
        leftCompOperator,
        centerCompOperator,
        rightCompOperator,
        rightMostCompOperator,
      ];
  @computed
  List<int> get listIndices => [
        leftMostIndex,
        leftIndex,
        currentlySelectedIndex,
        rightIndex,
        rightMostIndex,
      ];

  @computed
  int get focusListCardinalLength => theFocusedList.length - 1;

  @computed
  List<GeneralDateTimeReturnType> get theFocusedList =>
      currentFocus == DateOrTime.date ? dates : times;

  @action
  setUIArray(List<GeneralDateTimeReturnType> inputArr) {
    List<UIArray> finishedArray = [];
    for (int i = 0; i < comparisonList.length; i++) {
      finishedArray.add(
        comparisonList[i]
            ? UIArray(
                gradient: ConveyerColors.invisible,
                date: "",
              )
            : UIArray(
                gradient: theFocusedList[listIndices[i]].isBelowMinDate
                    ? ConveyerColors.outOfRange
                    : ConveyerColors.inRange,
                date: theFocusedList[listIndices[i]].formatted,
              ),
      );
    }
    uiArray = finishedArray;
  }

  @observable
  int currentlySelectedIndex = 0;

  List<GeneralDateTimeReturnType> dates = [];

  List<GeneralDateTimeReturnType> times = [];

  final ReturnDateOrTimeArray logic;

  InputConverterReturnType convertCurrentState(
      {required bool isADate, required bool isAForwardMovementParam}) {
    final chosenIndex =
        isAForwardMovementParam == true ? rightIndex : leftIndex;
    DateTime newDateOrTime;
    bool updateTheDate;
    if (isADate) {
      updateTheDate = true;
      newDateOrTime = dates[chosenIndex].unformatted;
    } else {
      updateTheDate = false;
      newDateOrTime = times[chosenIndex].unformatted;
    }
    return InputConverterReturnType(
      chosenIndex: chosenIndex,
      newDateOrTime: newDateOrTime,
      updateTheDate: updateTheDate,
    );
  }

  @action
  setCurrentlySelectedIndex(int index) {
    currentlySelectedIndex = index;
  }

  @action
  toggleListFocus() => currentFocus == DateOrTime.date
      ? currentFocus = DateOrTime.time
      : currentFocus = DateOrTime.date;

  @action
  setDatesArray(DateTime setDate) {
    returnEntity = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: DateOrTime.date,
        currentTime: setDate,
      ),
    );
    dates = returnEntity.dateOrTimeList;
    setCurrentlySelectedIndex(returnEntity.activeSelectionIndex);
  }

  @action
  setTimesArray(DateTime setDate) {
    returnEntity = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: DateOrTime.time,
        currentTime: setDate,
      ),
    );
    toggleListFocus();
    times = returnEntity.dateOrTimeList;
    setCurrentlySelectedIndex(returnEntity.activeSelectionIndex);
  }

  @action
  initForwardMovie() {
    if (movieStatus == MovieStatus.inProgress) return;
    if (currentlySelectedIndex == focusListCardinalLength) {
    } else {
      movie = ForwardsOrBackwards.getMovie(isForward: true);
      movieMode = ConveyerMovieModes.forward;
      control = Control.playFromStart;
      movieStatus = MovieStatus.inProgress;
    }
  }

  @action
  initBackwardMovie() {
    if (movieStatus == MovieStatus.inProgress) return;
    if (currentlySelectedIndex == 0) {
    } else {
      movie = ForwardsOrBackwards.getMovie(isForward: false);
      movieMode = ConveyerMovieModes.backwards;
      control = Control.playFromStart;
      movieStatus = MovieStatus.inProgress;
    }
  }

  @action
  onCompletedMovie() {
    switch (movieMode) {
      case ConveyerMovieModes.forward:
        control = Control.stop;
        movie = DefaultLayoutMovie.movie;
        Future.delayed(Seconds.get(0), () {
          setCurrentlySelectedIndex(currentlySelectedIndex + 1);
          currentFocus == DateOrTime.date
              ? setUIArray(dates)
              : setUIArray(times);
        });
        movieMode = currentlySelectedIndex == focusListCardinalLength
            ? ConveyerMovieModes.idleMax
            : ConveyerMovieModes.idleInRange;
        movieStatus = MovieStatus.idle;
      case ConveyerMovieModes.backwards:
        control = Control.stop;
        movie = DefaultLayoutMovie.movie;
        Future.delayed(Seconds.get(0), () {
          setCurrentlySelectedIndex(currentlySelectedIndex - 1);
          currentFocus == DateOrTime.date
              ? setUIArray(dates)
              : setUIArray(times);
        });
        movieMode = currentlySelectedIndex == 0
            ? ConveyerMovieModes.idleMin
            : ConveyerMovieModes.idleInRange;
        movieStatus = MovieStatus.idle;
      default:
        movieStatus = MovieStatus.idle;
        break;
    }
  }

  @override
  List<Object> get props => [];
}
