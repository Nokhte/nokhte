import 'package:equatable/equatable.dart';

class CollaboratorsDateAndTime extends Equatable {
  final DateTime date;
  final DateTime time;

  CollaboratorsDateAndTime({
    required this.date,
    required this.time,
  });
  @override
  List<Object> get props => [];
}
