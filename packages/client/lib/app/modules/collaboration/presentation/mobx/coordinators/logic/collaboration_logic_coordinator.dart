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
  final CancelNokhteSessionSearchStream cancelNokhteSessionSearchStreamLogic;
  final EnterCollaboratorPool enterCollaboratorPoolLogic;
  final ExitCollaboratorPool exitCollaboratorPoolLogic;
  final GetNokhteSessionSearchStatus getNokhteSessionSearchStatusLogic;

  _CollaborationLogicCoordinatorBase({
    required this.cancelNokhteSessionSearchStreamLogic,
    required this.enterCollaboratorPoolLogic,
    required this.exitCollaboratorPoolLogic,
    required this.getNokhteSessionSearchStatusLogic,
  });

  @observable
  bool nokhteSessionSearchStatusIsListening = false;

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
    nokhteSessionSearchStatusIsListening =
        cancelNokhteSessionSearchStreamLogic(NoParams());
    await collaboratorSearchStatus.close();
    await searchSubscription.cancel();
  }

  @action
  listenToNokhteSearch() async {
    nokhteSessionSearchStatusIsListening = true;
    final result = await getNokhteSessionSearchStatusLogic(NoParams());
    result.fold((failure) => errorUpdater(failure), (stream) {
      nokhteSearchStatus = ObservableStream(stream);
      nokhteSubscription = nokhteSearchStatus.listen((value) {
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
