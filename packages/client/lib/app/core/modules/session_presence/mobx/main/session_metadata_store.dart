// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
part 'session_metadata_store.g.dart';

class SessionMetadataStore = _SessionMetadataStoreBase
    with _$SessionMetadataStore;

abstract class _SessionMetadataStoreBase
    with Store, BaseMobxLogic<NoParams, Stream<NokhteSessionMetadata>> {
  final ListenToSessionMetadata listenLogic;
  final GetStaticSessionMetadata getterLogic;
  final GetSessionPresetInfo presetLogic;
  final GetInstructionType getInstructionTypeLogic;
  _SessionMetadataStoreBase({
    required this.listenLogic,
    required this.getInstructionTypeLogic,
    required this.getterLogic,
    required this.presetLogic,
  }) {
    initBaseLogicActions();
  }

  @observable
  int userIndex = -1;

  @observable
  bool everyoneIsOnline = false;

  @observable
  bool userIsSpeaking = false;

  @observable
  bool userCanSpeak = false;

  @observable
  ObservableList<double> currentPhases = ObservableList.of([]);

  @observable
  bool isAPremiumSession = false;

  @observable
  bool sessionHasBegun = false;

  @observable
  bool leaderIsWhitelisted = false;

  @observable
  bool isAValidSession = false;

  @observable
  String presetUID = '';

  @observable
  String presetName = '';

  @observable
  ObservableList presetTags = ObservableList.of([]);

  @observable
  ObservableList oddConfiguration = ObservableList.of([]);

  @observable
  ObservableList evenConfiguration = ObservableList.of([]);

  @observable
  SessionInstructionTypes instructionType = SessionInstructionTypes.initial;

  @observable
  ObservableStream<NokhteSessionMetadata> sessionMetadata =
      ObservableStream(const Stream.empty());

  StreamSubscription streamSubscription =
      const Stream.empty().listen((event) {});

  dispose() async {
    await streamSubscription.cancel();
    await sessionMetadata.close();
  }

  @action
  _getInstructionType(String unifiedUID) async {
    final res = await getInstructionTypeLogic(unifiedUID);
    res.fold(
      (failure) => errorUpdater(failure),
      (instructionType) => this.instructionType = instructionType,
    );
  }

  @action
  _getStaticMetadata() async {
    final res = await getterLogic(NoParams());
    res.fold((failure) => mapFailureToMessage(failure), (entity) async {
      leaderIsWhitelisted = entity.leaderIsWhitelisted;
      isAPremiumSession = entity.isAPremiumSession;
      isAValidSession = entity.isAValidSession;
      userIndex = entity.userIndex;
      presetUID = entity.presetUID;
      if (presetName.isEmpty) {
        final res = await presetLogic(presetUID);
        res.fold((failure) => mapFailureToMessage(failure), (presetEntity) {
          presetName = presetEntity.name;
          presetTags = ObservableList.of(presetEntity.tags);
          oddConfiguration = ObservableList.of(presetEntity.oddConfiguration);
          evenConfiguration = ObservableList.of(presetEntity.evenConfiguration);
        });
      }
    });
    //
  }

  @action
  Future<void> get(params) async {
    final result = await listenLogic(params);
    result.fold(
      (failure) {
        setErrorMessage(mapFailureToMessage(failure));
        setState(StoreState.initial);
      },
      (stream) {
        sessionMetadata = ObservableStream(stream);
        streamSubscription = sessionMetadata.listen((value) async {
          if (value.phases.length != currentPhases.length) {
            await _getStaticMetadata();
            await _getInstructionType(presetUID);
          }
          everyoneIsOnline = value.everyoneIsOnline;
          final phases = value.phases.map((e) => double.parse(e.toString()));
          currentPhases = ObservableList.of(phases);
          sessionHasBegun = value.sessionHasBegun;
          userIsSpeaking = value.userIsSpeaking;
          userCanSpeak = value.userCanSpeak;
        });
        setState(StoreState.loaded);
      },
    );
  }

  List<List> splitList(List motherList) {
    List evenList = [];
    List oddList = [];

    for (int i = 0; i < motherList.length; i++) {
      if (i.isEven) {
        evenList.add(motherList[i]);
      } else {
        oddList.add(motherList[i]);
      }
    }

    return [evenList, oddList];
  }

  SessionScreenTypes fromRawScreenType(String param) {
    if (param.contains('solo')) {
      return SessionScreenTypes.soloHybrid;
    } else if (param.contains('group')) {
      return SessionScreenTypes.groupHybrid;
    } else if (param.contains('speaking')) {
      return SessionScreenTypes.speaking;
    } else if (param.contains('notes')) {
      return SessionScreenTypes.notes;
    } else {
      return SessionScreenTypes.inital;
    }
  }

  @computed
  bool get canStartTheSession => currentPhases.every((e) => e >= 1.0);

  @computed
  bool get canStartUsingSession =>
      currentPhases.every((e) => e.isGreaterThanOrEqualTo(2));

  @computed
  bool get canExitTheSession => currentPhases.every((e) => e == 3);

  @computed
  bool get canReturnHome =>
      currentPhases.every((e) => e.isGreaterThanOrEqualTo(5));

  @computed
  double get userPhase => currentPhases[userIndex];

  @computed
  List get evenList => splitList(currentPhases)[0];

  @computed
  int get numberOfAffirmative {
    int count = 0;
    for (double value in currentPhases) {
      if (value == 4.0) {
        count++;
      }
    }
    return count;
  }

  @computed
  PresetTypes get presetType {
    if (presetName.contains('sultat')) {
      return PresetTypes.consultative;
    } else if (presetName.contains('llaborat')) {
      return PresetTypes.collaborative;
    } else if (presetName.contains('crat')) {
      return PresetTypes.socratic;
    } else {
      return PresetTypes.none;
    }
  }

  @computed
  List get oddList => splitList(currentPhases)[1];

  @computed
  List get everyoneButUserPhases {
    final phases = currentPhases.map((e) => e).toList();
    phases.removeAt(userIndex);
    return phases;
  }

  @computed
  SessionScreenTypes get sessionScreenType {
    if (evenConfiguration.isEmpty || oddConfiguration.isEmpty) {
      return SessionScreenTypes.inital;
    } else {
      if (evenConfiguration.length == 1 && oddConfiguration.length == 1) {
        return fromRawScreenType(evenConfiguration.first);
      } else {
        final moduloIndex = userIndex % 2;
        if (numberOfCollaborators.isOdd) {
          if (userIndex == numberOfCollaborators - 1) {
            return fromRawScreenType(oddConfiguration.last);
          } else {
            return fromRawScreenType(oddConfiguration[moduloIndex]);
          }
        } else {
          return fromRawScreenType(evenConfiguration[moduloIndex]);
        }
      }
    }
  }

  @computed
  int get numberOfCollaborators => currentPhases.length;
}
