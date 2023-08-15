// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/cupertino.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'canvas/beach_waves_painter.dart';

class BeachWaves extends StatefulWidget {
  final Size size;
  final BeachWavesTrackerStore stateTrackerStore;
  const BeachWaves({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  _BeachWavesState createState() => _BeachWavesState(
        size: size,
        stateTrackerStore: stateTrackerStore,
      );
}

class _BeachWavesState extends State<BeachWaves>
    with SingleTickerProviderStateMixin {
  final Size size;
  final BeachWavesTrackerStore stateTrackerStore;
  late AnimationController _controller;

  _BeachWavesState({
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BeachWavesPainter(_controller),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}
