// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
part 'collaboration_logic_coordinator.g.dart';

class CollaborationLogicCoordinator = _CollaborationLogicCoordinatorBase
    with _$CollaborationLogicCoordinator;

abstract class _CollaborationLogicCoordinatorBase extends BaseMobxDBStore
    with Store {
  final CancelCollaboratorSearchStream cancelCollaboratorSearchStreamLogic;
  final EnterCollaboratorPool enterCollaboratorPoolLogic;
  final ExitCollaboratorPool exitCollaboratorPoolLogic;
  final GetCollaboratorSearchStatus getCollaboratorSearchStatusLogic;
  final GetNokhteSessionSearchStatus getNokhteSessionSearchStatusLogic;

  _CollaborationLogicCoordinatorBase({
    required this.cancelCollaboratorSearchStreamLogic,
    required this.enterCollaboratorPoolLogic,
    required this.exitCollaboratorPoolLogic,
    required this.getCollaboratorSearchStatusLogic,
    required this.getNokhteSessionSearchStatusLogic,
  });

  @observable
  bool collaboratorSearchStatusIsListening = false;

  @observable
  bool nokhteSearchStatusIsListening = false;

  @observable
  bool hasEntered = false;

  @observable
  ObservableStream<bool> collaboratorSearchStatus =
      ObservableStream(const Stream.empty());

  @observable
  ObservableStream<bool> nokhteSearchStatus =
      ObservableStream(const Stream.empty());

  @observable
  bool hasFoundCollaborator = false;

  @observable
  bool hasFoundNokhteSession = false;

  StreamSubscription searchSubscription =
      Stream.value(false).listen((event) {});
  StreamSubscription nokhteSubscription =
      Stream.value(false).listen((event) {});

  @action
  dispose() async {
    collaboratorSearchStatusIsListening =
        cancelCollaboratorSearchStreamLogic(NoParams());
    await collaboratorSearchStatus.close();
    await searchSubscription.cancel();
  }

  @action
  listenToCollaboratorSearch() async {
    collaboratorSearchStatusIsListening = true;
    final result = await getCollaboratorSearchStatusLogic(NoParams());
    result.fold((failure) => errorUpdater(failure), (stream) {
      collaboratorSearchStatus = ObservableStream(stream);
      searchSubscription = collaboratorSearchStatus.listen(
        (value) => hasFoundCollaborator = value,
      );
    });
  }

  @action
  listenToNokhteSearch() async {
    // print("are you being called??");
    nokhteSearchStatusIsListening = true;
    final result = await getNokhteSessionSearchStatusLogic(NoParams());
    result.fold((failure) => errorUpdater(failure), (stream) {
      nokhteSearchStatus = ObservableStream(stream);
      nokhteSubscription = nokhteSearchStatus.listen((value) {
        // print("hey is this one working??");
        hasFoundNokhteSession = value;
      });
    });
  }

  @action
  enter(EnterCollaboratorPoolParams collaboratorUID) async {
    final result = await enterCollaboratorPoolLogic(collaboratorUID);
    result.fold((failure) => errorUpdater(failure),
        (entryStatus) => hasEntered = entryStatus);
  }

  @action
  exit() async {
    final result = await exitCollaboratorPoolLogic(NoParams());
    result.fold((failure) => errorUpdater(failure),
        (exitStatus) => hasEntered = exitStatus);
  }

  @override
  List<Object> get props => [];
}
