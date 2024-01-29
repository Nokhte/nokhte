import 'package:flutter/material.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/mobx/coordinators/phase1/nokhte_session_phase1_coordinator.dart';

class NokhteSessionPhase1 extends StatelessWidget {
  final NokhteSessionPhase1Coordinator coordinator;
  const NokhteSessionPhase1({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Phase 1"),
      ),
    );
  }
}
