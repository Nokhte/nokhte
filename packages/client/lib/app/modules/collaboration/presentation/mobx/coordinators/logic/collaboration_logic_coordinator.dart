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

  _CollaborationLogicCoordinatorBase({
    required this.cancelCollaboratorSearchStreamLogic,
    required this.enterCollaboratorPoolLogic,
    required this.exitCollaboratorPoolLogic,
    required this.getCollaboratorSearchStatusLogic,
  });

  @observable
  bool searchStatusIsListening = false;

  @observable
  bool hasEntered = false;

  @observable
  ObservableStream<bool> searchStatus = ObservableStream(const Stream.empty());

  @observable
  bool hasFoundCollaborator = false;

  StreamSubscription searchSubscription =
      Stream.value(false).listen((event) {});

  @action
  dispose() async {
    searchStatusIsListening = cancelCollaboratorSearchStreamLogic(NoParams());
    await searchStatus.close();
    await searchSubscription.cancel();
  }

  @action
  listen() async {
    searchStatusIsListening = true;
    final result = await getCollaboratorSearchStatusLogic(NoParams());
    result.fold((failure) => errorUpdater(failure), (stream) {
      searchStatus = ObservableStream(stream);
      searchSubscription = searchStatus.listen(
        (value) => hasFoundCollaborator = value,
      );
    });
  }

  @action
  enter(String collaboratorUID) async {
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
