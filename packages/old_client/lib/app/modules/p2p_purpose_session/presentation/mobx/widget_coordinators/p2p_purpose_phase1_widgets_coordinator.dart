// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase1_widgets_coordinator.g.dart';

class P2PPurposePhase1WidgetsCoordinator = _P2PPurposePhase1WidgetsCoordinatorBase
    with _$P2PPurposePhase1WidgetsCoordinator;

abstract class _P2PPurposePhase1WidgetsCoordinatorBase extends Equatable
    with Store {
  final NewBeachWavesStore newBeachWaves;
  final GesturePillStore gesturePillStore;
  final FadeInAndChangeColorTextStore fadeInColorText;
  final SmartFadingAnimatedTextTrackerStore fadingText;

  _P2PPurposePhase1WidgetsCoordinatorBase({
    required this.newBeachWaves,
    required this.fadingText,
    required this.fadeInColorText,
    required this.gesturePillStore,
  });

  @action
  constructor() {
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ], secondGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ]));
    fadingText.setMessagesData(MessagesData.p2pPurposeSession);
    fadingText.startRotatingText(Seconds.get(0));
    newBeachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
  }

  moveToPhase2() {
    gesturePillStore.setPillAnimationControl(Control.playFromStart);
    fadingText.fadeTheTextOut();
    Future.delayed(Seconds.get(3), () {
      Modular.to.navigate('/p2p_purpose_session/phase-2/');
    });
  }

  @override
  List<Object> get props => [
// some items
      ];
}
