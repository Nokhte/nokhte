import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';

class PurposeSessionPhase1Greeter extends HookWidget {
  final PurposeSessionRemoteSourceImpl remoteSource;
  const PurposeSessionPhase1Greeter({
    super.key,
    required this.remoteSource,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      remoteSource.deleteCollaboration();
      return null;
    }, []);
    return const Scaffold(
      body: Center(child: Text("Purpose Session")),
    );
  }
}
