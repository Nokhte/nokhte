// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/constants/movies/movies.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/constants/types/conveyer_movie_modes.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'conveyer_belt_text_store.g.dart';

class ConveyerBeltTextStore = _ConveyerBeltTextStoreBase
    with _$ConveyerBeltTextStore;

abstract class _ConveyerBeltTextStoreBase extends Equatable with Store {
  @observable
  bool showWidget = false;

  DateOrTime currentFocus = DateOrTime.date;

  @observable
  MovieTween movie = DefaultLayoutMovie.movie;

  @observable
  ConveyerMovieModes movieMode = ConveyerMovieModes.idleInRange;

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @observable
  Control control = Control.stop;

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

  _ConveyerBeltTextStoreBase({
    required this.logic,
    required DateOrTime dateOrTimeParam,
  }) {
    setDatesArray();
    print(dates.toString());
    setUIArray(dates);
  }

  @action
  void setWidgetVisibility(bool newVisiblity) => showWidget = newVisiblity;

  @action
  setCurrentlySelectedIndex(int index) {
    currentlySelectedIndex = index;
  }

  @action
  toggleListFocus() => currentFocus == DateOrTime.date
      ? currentFocus = DateOrTime.time
      : DateOrTime.date;

  @action
  setDatesArray() {
    returnEntity = logic(
      ReturnDateOrTimeArrayParams(
        dateOrTime: DateOrTime.date,
        currentTime: DateTime.now(),
      ),
    );
    // print("${returnEntity.dateOrTimeList[0].isBelowMinDate}");
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
    toggleListFocus();
    times = returnEntity.dateOrTimeList;
    setCurrentlySelectedIndex(returnEntity.activeSelectionIndex);
  }

  @action
  initForwardMovie() {
    // print("is forward running?? $movieStatus");
    if (movieStatus == MovieStatus.inProgress) return;
    if (currentlySelectedIndex == focusListCardinalLength) {
      movie = AtMinOrMax.getMovie(atMin: false); // at max
      control = Control.play;
      movieStatus = MovieStatus.inProgress;
    } else {
      movie = ForwardsOrBackwards.getMovie(isForward: true); // at min
      movieMode = ConveyerMovieModes.forward;
      control = Control.play;
      movieStatus = MovieStatus.inProgress;
    }
  }

  @action
  initBackwardMovie() {
    if (movieStatus == MovieStatus.inProgress) return;
    if (currentlySelectedIndex == 0) {
      movie = AtMinOrMax.getMovie(atMin: true);
      control = Control.play;
      movieStatus = MovieStatus.inProgress;
    } else {
      movie = ForwardsOrBackwards.getMovie(isForward: false); // at min
      movieMode = ConveyerMovieModes.backwards;
      control = Control.play;
      movieStatus = MovieStatus.inProgress;
    }
  }

  @action
  onCompletedMovie() {
    switch (movieMode) {
      case ConveyerMovieModes.forward:
        movie = DefaultLayoutMovie.movie;
        setCurrentlySelectedIndex(currentlySelectedIndex + 1);
        currentFocus == DateOrTime.date ? setUIArray(dates) : setUIArray(times);
        movieMode = currentlySelectedIndex == focusListCardinalLength
            ? ConveyerMovieModes.idleMax
            : ConveyerMovieModes.idleInRange;
        movieStatus = MovieStatus.idle;
      case ConveyerMovieModes.backwards:
        movie = DefaultLayoutMovie.movie;
        setCurrentlySelectedIndex(currentlySelectedIndex - 1);
        currentFocus == DateOrTime.date ? setUIArray(dates) : setUIArray(times);
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
