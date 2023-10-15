import 'package:equatable/equatable.dart';

class GeneralDateTimeReturnType extends Equatable {
  final String formatted;
  final DateTime unformatted;
  final bool isTheActiveOne;
  const GeneralDateTimeReturnType({
    required this.formatted,
    required this.unformatted,
    this.isTheActiveOne = false,
  });

  @override
  List<Object> get props => [
        formatted,
        unformatted,
      ];
}
