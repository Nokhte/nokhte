import 'package:equatable/equatable.dart';

class GeneralDateTimeReturnType extends Equatable {
  final String formatted;
  final DateTime unformatted;
  final bool isTheActiveOne;
  final bool isBelowMinDate;
  const GeneralDateTimeReturnType({
    required this.formatted,
    required this.unformatted,
    required this.isTheActiveOne,
    required this.isBelowMinDate,
  });

  @override
  List<Object> get props => [
        formatted,
        unformatted,
      ];
}
