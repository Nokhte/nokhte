// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenCoordinatorStore coordinator;

  LoginScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );

    return StreamBuilder<bool>(
        stream: coordinator.authStateStore.authState,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            Modular.to.navigate('/home/');
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Swipe(
              trackerStore: coordinator.swipe,
              child: Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: DumbBeachWaves(movie: OnShore.movie)),
                  Column(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GesturePill(
                            size: size,
                            stateTrackerStore: coordinator.gesturePillStore,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
