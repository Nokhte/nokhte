// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'p2p_purpose_phase4_coordinator_store.g.dart';

class P2PPurposePhase4CoordinatorStore = _P2PPurposePhase4CoordinatorStoreBase
    with _$P2PPurposePhase4CoordinatorStore;

abstract class _P2PPurposePhase4CoordinatorStoreBase extends BaseTimesUpStore
    with Store {
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final SoloDocCoordinator soloDoc;

  _P2PPurposePhase4CoordinatorStoreBase({
    required super.timer,
    required super.beachWaves,
    required this.abortPurposeSessionArtifactsStore,
    required this.fadingText,
    required this.soloDoc,
  }) : super(productionTimerLength: const Duration(minutes: 5)) {
    beachWavesMovieStatusListener();
  }

  final duration = kDebugMode ? Seconds.get(20) : const Duration(minutes: 5);

  @action
  beachWavesMovieStatusListener() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        print("phase 4 ${beachWaves.movieStatus} ${beachWaves.movieMode}");
        if (beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          if (beachWaves.movieStatus == MovieStatus.finished) {
            beachWaves.teeUpBackToTheDepths();
            Future.delayed(Seconds.get(3), () {
              cleanUpAndTransition();
            });
          } else if (beachWaves.movieStatus == MovieStatus.inProgress) {
            delayedNavigation(() {
              beachWaves.teeUpBackToTheDepths();
              Future.delayed(Seconds.get(3), () {
                cleanUpAndTransition();
              });
            });
          }
        }
      });

  @action
  cleanUpAndTransition() async {
    print("was this phase 5 ranstioncalled");
    await timer.deleteTheTimer(NoParams());
    fadingText.fadeTheTextOut();
    Modular.to.navigate('/p2p_purpose_session/phase-5/');
  }

  @action
  screenConstructor() async {
    // beachWavesMovieStatusListener();
    fadingText.startRotatingText(Seconds.get(0));
    beachWaves.initiateSuspendedAtTheDepths();
    beachWaves.initiateTimesUp(timerLength: duration);

    fadingText.moveToNextMessage();
    await timer.setupAndStreamListenerActivation(
        const CreateTimerParams(timerLengthInMinutes: 5), initOrPauseTimesUp);
    await timer.setOnlineStatus(true);
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => await timer.setOnlineStatus(true),
      inactiveCallback: () async => await timer.setOnlineStatus(false),
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase4ReciprocateAttention,
        ),
      ),
    );
    fadingText.fadeTheTextIn();
    await soloDoc
        .getSoloDoc(
          const GetSoloDocParams(
            getCollaboratorsDoc: true,
          ),
        )
        .then((value) => Future.delayed(Seconds.get(2), () {
              fadingText.togglePause();
            }));
    fadingText.setMainMessage(
      index: 4,
      thePhrase: soloDoc.getSoloDoc.docContent,
    );
  }

  @override
  List<Object> get props => [];
}
