// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'breathing_pentagons_state_tracker_store.g.dart';

class BreathingPentagonsStateTrackerStore = _BreathingPentagonsStateTrackerStoreBase
    with _$BreathingPentagonsStateTrackerStore;

abstract class _BreathingPentagonsStateTrackerStoreBase extends Equatable
    with Store {
  @observable
  MovieTween movie = MovieTween()
    // initial spin
    ..scene(begin: const Duration(seconds: 0), end: const Duration(seconds: 6))
        .tween(
      'angle',
      Tween<double>(
        begin: 0,
        end: 1.25,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 6),
    ).tween(
      'scale',
      Tween<double>(
        begin: .6,
        end: .95,
      ),
    );

  @observable
  Control controlType = Control.stop;

  @observable
  bool isExpansionDone = false;

  @observable
  double startingPoint = 0.0;

  @action
  void expansionIsDone() {
    isExpansionDone = true;
    startingPoint = 0.5;
    controlType = Control.loop;
    movie = MovieTween()
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 6))
          .tween(
        'angle',
        Tween<double>(
          begin: 0,
          end: 1.25,
        ),
      )
      ..scene(
              begin: const Duration(seconds: 6),
              end: const Duration(seconds: 6))
          .tween(
        'angle',
        Tween<double>(
          begin: 1.25,
          end: 0,
        ),
      )
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 6))
          .tween(
        'scale',
        Tween<double>(
          begin: .95,
          end: .95,
        ),
      );
  }

  @override
  List<Object> get props => [
// some items
      ];
}
