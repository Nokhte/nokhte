import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StartAndEndOffsets extends Equatable {
  final Offset start;
  final Offset end;

  const StartAndEndOffsets({
    required this.start,
    required this.end,
  });

  factory StartAndEndOffsets.initial() => const StartAndEndOffsets(
        start: Offset.zero,
        end: Offset.zero,
      );

  @override
  List<Object> get props => [start, end];
}
