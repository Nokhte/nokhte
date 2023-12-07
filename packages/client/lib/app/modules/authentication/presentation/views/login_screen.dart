// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget with WidgetsBindingObserver {
  final LoginScreenCoordinator coordinator;

  const LoginScreen({
    super.key,
    required this.coordinator,
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      coordinator.setAppState(state);

  @override
  Widget build(BuildContext context) {
    useOnStreamChange<bool>(coordinator.authStateStore.authState,
        onData: (isLoggedIn) {
      if (isLoggedIn) {}
    });
    useEffect(() {
      coordinator.screenConstructor();
      WidgetsBinding.instance.addObserver(this);
      return null;
    }, []);

    return Builder(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Tap(
          trackerStore: coordinator.tap,
          child: Swipe(
            trackerStore: coordinator.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachWaves(store: coordinator.beachWaves),
                ),
                Center(child: SmartText(store: coordinator.smartTextStore)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Nokhte(
                    store: coordinator.nokhte,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
