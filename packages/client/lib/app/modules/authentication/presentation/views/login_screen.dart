// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  final LoginScreenCoordinatorStore coordinator;

  const LoginScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useOnStreamChange<bool>(coordinator.authStateStore.authState,
        onData: (isLoggedIn) {
      if (isLoggedIn) {}
    });
    useEffect(() {
      coordinator.screenConstructor();
      return null;
    }, []);
    return Builder(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Swipe(
          trackerStore: coordinator.swipe,
          child: Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachWaves(
                    store: coordinator.beachWaves,
                  )
                  // child: BeachWaves(movie: OnShore.movie),
                  ),
            ],
          ),
        ),
      );
    });
  }
}
