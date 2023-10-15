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
  List<GeneralDateTimeReturnType> dates = [];

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
  }

  @computed
  String get leftMostValue => currentlySelectedIndex - 2 < 0
      ? ""
      : dates[currentlySelectedIndex - 2].formatted;

  @computed
  String get leftValue => currentlySelectedIndex - 1 < 0
      ? ""
      : dates[currentlySelectedIndex - 1].formatted;

  @computed
  String get centerValue => dates[currentlySelectedIndex].formatted;

  @computed
  String get rightValue => currentlySelectedIndex + 1 > (dates.length - 1)
      ? ""
      : dates[currentlySelectedIndex + 1].formatted;

  @computed
  String get rightMostValue => currentlySelectedIndex + 2 > (dates.length - 1)
      ? ""
      : dates[currentlySelectedIndex + 2].formatted;

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
