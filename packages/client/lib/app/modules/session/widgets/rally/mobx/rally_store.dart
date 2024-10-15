// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/widgets/widgets.dart';
part 'rally_store.g.dart';

class RallyStore = _RallyStoreBase with _$RallyStore;

abstract class _RallyStoreBase extends BaseWidgetStore with Store, Reactions {
  final TintStore tint;
  final BackButtonStore backButton;

  _RallyStoreBase({
    required this.tint,
    required this.backButton,
  }) {
    setWidgetVisibility(false);
  }

  @action
  constructor() {
    tint.startAtEnd();
    disposers.add(backButtonTapReactor());
  }

  @observable
  RallyPhase phase = RallyPhase.initial;

  @observable
  ObservableList<String> collaborators = ObservableList.of([]);

  @observable
  ObservableList<bool> canRally = ObservableList.of([]);

  @action
  setCollaborators(List<String> value) =>
      collaborators = ObservableList.of(value);

  @action
  setCanRally(List<bool> value) => canRally = ObservableList.of(value);

  @action
  setRallyPhase(RallyPhase value) {
    setWidgetVisibility(false);
    Timer(Seconds.get(0, milli: 500), () {
      phase = value;
      setWidgetVisibility(true);
    });
  }

  @action
  reset() {
    setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      phase = RallyPhase.initial;
    });
  }

  backButtonTapReactor() => reaction((p0) => backButton.tapCount, (p0) {
        if (phase == RallyPhase.selection) {
          setRallyPhase(RallyPhase.initial);
        }
      });
}
