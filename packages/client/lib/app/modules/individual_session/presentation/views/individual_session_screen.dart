import 'package:flutter/widgets.dart';
import 'package:nokhte/app/modules/individual_session/presentation/mobx/coordinators/individual_session_screen_coordinator_store.dart';

class IndividualSessionScreen extends StatelessWidget {
  final IndividualSessionScreenCoordinatorStore coordinator;
  IndividualSessionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
