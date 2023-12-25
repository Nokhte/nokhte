import 'package:equatable/equatable.dart';

class BaseHourMarkProperties extends Equatable {
  final List<double> rotations;
  final List<double> translations;
  final List<double> lengths;

  const BaseHourMarkProperties({
    required this.lengths,
    required this.rotations,
    required this.translations,
  });

  @override
  List<Object> get props => [lengths, rotations, translations];
}
