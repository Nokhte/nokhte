// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'p2p_purpose_phase4_coordinator_store.g.dart';

class P2PPurposePhase4CoordinatorStore = _P2PPurposePhase4CoordinatorStoreBase
    with _$P2PPurposePhase4CoordinatorStore;

abstract class _P2PPurposePhase4CoordinatorStoreBase extends BaseTimesUpStore
    with Store {
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final SoloDocCoordinatorStore soloDoc;

  _P2PPurposePhase4CoordinatorStoreBase({
    required super.timer,
    required super.beachWaves,
    required this.fadingText,
    required this.soloDoc,
  }) : super(productionTimerLength: const Duration(minutes: 5)) {
    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
        beachWaves.teeUpBackToTheDepths();
        // beachWaves.backToTheDepthsCount++;
      } else if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
        fadingText.fadeTheTextOut();
        Modular.to.navigate('/p2p_purpose_session/phase-5/');
      }
    });
  }

  @action
  screenConstructor() async {
    fadingText.startRotatingText(Seconds.get(0));
    beachWaves.initiateSuspendedAtTheDepths();

    fadingText.moveToNextMessage();
    await timer.setupAndStreamListenerActivation(
        const CreateTimerParams(timerLengthInMinutes: 5), initOrPauseTimesUp);
    foregroundAndBackgroundStateListener();
    fadingText.fadeTheTextIn();
    await soloDoc
        .getSoloDoc(
          const GetSoloDocParams(
            getCollaboratorsDoc: true,
          ),
        )
        .then((value) => Future.delayed(Seconds.get(2), () {
              fadingText.togglePause();
              beachWaves.initiateTimesUp(
                timerLength: const Duration(
                  minutes: 5,
                ),
                // pMovieMode: MovieModes.purposeCallTimesUp,
              );
            }));
    fadingText.setMainMessage(
      index: 4,
      thePhrase: soloDoc.getSoloDoc.docContent,
    );
  }

  @override
  List<Object> get props => [];
}
