import 'package:equatable/equatable.dart';

class CustomDuration extends Equatable {
  final Duration begin;
  final Duration end;
  const CustomDuration({required this.begin, required this.end});

  @override
  List<Object> get props => [begin, end];
}
