// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
part 'session_metadata_store.g.dart';

class SessionMetadataStore = _SessionMetadataStoreBase
    with _$SessionMetadataStore;

abstract class _SessionMetadataStoreBase
    with Store, BaseMobxLogic<NoParams, Stream<NokhteSessionMetadata>> {
  final SessionPresenceContract contract;
  _SessionMetadataStoreBase({
    required this.contract,
  }) {
    initBaseLogicActions();
  }

  @observable
  int userIndex = 0;

  @observable
  bool everyoneIsOnline = false;

  @observable
  bool userIsSpeaking = false;

  @observable
  ObservableList<NameAndUID> namesAndUIDs = ObservableList.of([]);

  @observable
  String? currentSpeakerUID = '';

  @observable
  bool userIsInSecondarySpeakingSpotlight = false;

  @observable
  ObservableStream<DateTime> time =
      Stream.periodic(Seconds.get(1)).map((_) => DateTime.now()).asObservable();

  @observable
  bool userCanSpeak = false;

  @observable
  ObservableList<double> currentPhases = ObservableList.of(List.filled(9, -9));

  @observable
  bool secondarySpeakerSpotlightIsEmpty = false;

  @observable
  bool isAPremiumSession = false;

  @observable
  bool sessionHasBegun = false;

  @observable
  double affirmativePhase = -1.0;

  @observable
  bool leaderIsWhitelisted = false;

  @observable
  String leaderUID = '';

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
  DateTime speakingTimerStart = DateTime.fromMillisecondsSinceEpoch(0);

  @observable
  SessionInstructionTypes instructionType = SessionInstructionTypes.initial;

  @action
  setAffirmativePhase(double value) => affirmativePhase = value;

  @observable
  ObservableStream<NokhteSessionMetadata> sessionMetadata =
      ObservableStream(const Stream.empty());

  StreamSubscription streamSubscription =
      const Stream.empty().listen((event) {});

  @action
  resetValues() {
    setState(StoreState.initial);
    presetName = '';
    currentPhases = ObservableList.of(List.filled(9, -9));
  }

  @action
  dispose() {
    streamSubscription = const Stream.empty().listen((event) {});
    sessionMetadata = ObservableStream(const Stream.empty());
  }

  @action
  _getInstructionType(String unifiedUID) async {
    final res = await contract.getInstructionType(unifiedUID);
    res.fold(
      (failure) => errorUpdater(failure),
      (instructionType) => this.instructionType = instructionType,
    );
  }

  @action
  _getStaticMetadata() async {
    final res = await contract.getSTSessionMetadata(NoParams());
    res.fold((failure) => mapFailureToMessage(failure), (entity) async {
      isAPremiumSession = entity.isAPremiumSession;
      isAValidSession = entity.isAValidSession;
      if (presetName.isEmpty) {
        userIndex = entity.userIndex;
        leaderIsWhitelisted = entity.leaderIsWhitelisted;
        namesAndUIDs = ObservableList.of(entity.namesAndUIDs);
        presetUID = entity.presetUID;
        leaderUID = entity.leaderUID;
        final res = await contract.getSessionPresetInfo(presetUID);
        res.fold((failure) => mapFailureToMessage(failure), (presetEntity) {
          presetName = presetEntity.name;
          presetTags = ObservableList.of(presetEntity.tags);
          oddConfiguration = ObservableList.of(presetEntity.oddConfiguration);
          evenConfiguration = ObservableList.of(presetEntity.evenConfiguration);
        });
      }
    });
  }

  @action
  Future<void> get(params) async {
    resetValues();
    final result = await contract.listenToRTSessionMetadata(params);
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
          speakingTimerStart = value.speakingTimerStart;
          secondarySpeakerSpotlightIsEmpty = value.secondarySpotlightIsEmpty;
          userIsInSecondarySpeakingSpotlight =
              value.userIsInSecondarySpeakingSpotlight;
          currentSpeakerUID = value.speakerUID;
          currentPhases = ObservableList.of(phases);
          sessionHasBegun = value.sessionHasBegun;
          userIsSpeaking = value.userIsSpeaking;
          userCanSpeak = value.userCanSpeak;

          setState(StoreState.loaded);
        });
      },
    );
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

  getUIDFromName(String name) {
    for (var nameAndUID in namesAndUIDs) {
      if (nameAndUID.name == name) {
        return nameAndUID.uid;
      }
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
  int get numberOfAffirmative {
    int count = 0;
    for (double value in currentPhases) {
      if (value == affirmativePhase) {
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
  DateTime get now => time.value ?? DateTime.now();

  @computed
  int get speakingLength =>
      speakingTimerStart != DateTime.fromMillisecondsSinceEpoch(0)
          ? now.difference(speakingTimerStart).inSeconds
          : 0;

  @computed
  GlowColor get glowColor {
    if (userCanSpeak) {
      return GlowColor.transparent;
    } else {
      if (speakingLength <= 62) {
        return GlowColor.green;
      } else if (speakingLength > 62 && speakingLength <= 90) {
        return GlowColor.yellow;
      } else if (speakingLength > 90 && speakingLength < 107) {
        return GlowColor.red;
      } else {
        return GlowColor.inflectionRed;
      }
    }
  }

  @computed
  String get currentSpeakerFirstName {
    if (currentSpeakerUID != null) {
      String name = '';
      for (var nameAndUID in namesAndUIDs) {
        if (nameAndUID.uid == currentSpeakerUID) {
          name = nameAndUID.name.split(' ').first;
        }
      }
      return name;
    } else {
      return '';
    }
  }

  @computed
  bool get isCooking => !secondarySpeakerSpotlightIsEmpty && userIsSpeaking;

  @computed
  bool get isBeingRalliedWith =>
      userIsInSecondarySpeakingSpotlight && !userIsSpeaking;

  @computed
  bool get showLetEmCook =>
      !userIsSpeaking &&
      secondarySpeakerSpotlightIsEmpty &&
      glowColor != GlowColor.green;

  @computed
  int get numberOfCollaborators => currentPhases.length;

  @computed
  bool get someoneIsTakingANote =>
      currentPhases.any((element) => element == 2.5);

  @computed
  List<String> get fullNames {
    final names = <String>[];
    for (int i = 0; i < namesAndUIDs.length; i++) {
      if (i != userIndex) {
        names.add(namesAndUIDs[i].name);
      }
    }

    return names;
  }

  @computed
  List<bool> get canRallyArray {
    final list = <bool>[];
    for (int i = 0; i < currentPhases.length; i++) {
      if (i != userIndex) {
        list.add(currentPhases[i] == 2.0);
      }
    }
    return list;
  }
}
