// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import 'package:primala/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:primala/app/core/widgets/mobx.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase3_coordinator_store.g.dart';

class P2PPurposePhase3CoordinatorStore = _P2PPurposePhase3CoordinatorStoreBase
    with _$P2PPurposePhase3CoordinatorStore;

abstract class _P2PPurposePhase3CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final SoloTextEditorTrackerStore textEditor;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final SoloDocCoordinatorStore soloDoc;
  _P2PPurposePhase3CoordinatorStoreBase({
    required this.beachWaves,
    required this.textEditor,
    required this.fadingText,
    required this.soloDoc,
  }) {
    reaction((p0) => beachWaves.movieStatus, (p0) async {
      if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
        beachWaves.teeUpBackToTheDepths();
        beachWaves.backToTheDepthsCount++;
        textEditor.flipWidgetVisibility();
      } else if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
        final currentText = textEditor.controller.text;
        await soloDoc
            .createSoloDoc(const CreateSoloDocParams(docType: 'purpose'));
        await soloDoc.submitSoloDoc(SubmitSoloDocParams(content: currentText));
        await soloDoc.shareSoloDoc(NoParams());
        Modular.to.navigate('/p2p_purpose_session/phase-4/');
      }
    });
  }

  @action
  screenConstructor() {
    beachWaves.initiateSuspendedAtTheDepths();
    beachWaves.initiateTimesUp(
        timerLength: const Duration(
      seconds: 10,
      // minutes: 5,
      // TODO COMMENT OUT FOR PROD
    ));
    fadingText.moveToNextMessage();
    Future.delayed(const Duration(seconds: 1), () {
      fadingText.fadeTheTextIn();
    });
    Future.delayed(const Duration(seconds: 3), () {
      fadingText.fadeTheTextOut();
      textEditor.flipWidgetVisibility();
    });
    // textEditor.addEventListeners();
  }

  @override
  List<Object> get props => [];
}
