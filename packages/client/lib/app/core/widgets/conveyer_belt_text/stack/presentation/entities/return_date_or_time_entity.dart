import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/widgets.dart';

class ReturnDateOrTimeEntity extends Equatable {
  final List<GeneralDateTimeReturnType> dateOrTimeList;
  final int activeSelectionIndex;
  const ReturnDateOrTimeEntity({
    required this.dateOrTimeList,
    required this.activeSelectionIndex,
  });

  @override
  List<Object> get props => [
        dateOrTimeList,
        activeSelectionIndex,
      ];
}
