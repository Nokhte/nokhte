import 'package:equatable/equatable.dart';

class InputConverterReturnType extends Equatable {
  final int chosenIndex;
  final DateTime newDateOrTime;
  final bool updateTheDate;

  const InputConverterReturnType({
    required this.chosenIndex,
    required this.newDateOrTime,
    required this.updateTheDate,
  });

  @override
  List<Object> get props => [chosenIndex, newDateOrTime, updateTheDate];
}
