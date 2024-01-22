import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';

class PurposeSessionPhase3ExpandTheirIdeas extends HookWidget {
  final PurposeSessionPhase3Coordinator coordinator;
  const PurposeSessionPhase3ExpandTheirIdeas({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("phase 3")),
    );
  }
}
