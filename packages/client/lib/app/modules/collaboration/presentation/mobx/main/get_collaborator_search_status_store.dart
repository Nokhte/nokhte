// ignore_for_file: must_be_immutable, library_private_types_in_public_api, type_literal_in_constant_pattern
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
// import 'package:nokhte_backend/tables/existing_collaborations.dart';
part 'get_collaborator_search_status_store.g.dart';

class GetCollaboratorSearchStatusStore = _GetCollaboratorSearchStatusStoreBase
    with _$GetCollaboratorSearchStatusStore;

abstract class _GetCollaboratorSearchStatusStoreBase extends Equatable
    with Store {
  final GetCollaboratorSearchStatus logic;

  @observable
  ObservableStream<bool> searchStatus = ObservableStream(const Stream.empty());

  StreamSubscription searchSubscription =
      Stream.value(false).listen((event) {});

  @observable
  String errorMessage = "";

  @observable
  bool hasFoundCollaborator = false;

  @action
  toggleHasFoundCollaborator() => hasFoundCollaborator = !hasFoundCollaborator;

  @action
  resetStream() {
    searchStatus = ObservableStream(const Stream.empty());
  }

  @observable
  StoreState state = StoreState.initial;

  _GetCollaboratorSearchStatusStoreBase({
    required this.logic,
  });

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkConnectionFailure:
        return FailureConstants.internetConnectionFailureMsg;
      default:
        return FailureConstants.genericFailureMsg;
    }
  }

  @action
  dispose() async {
    await searchStatus.close();
    await searchSubscription.cancel();
  }

  Future<void> call() async {
    final result = await logic(NoParams());
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (stream) {
      searchStatus = ObservableStream(stream);
      searchSubscription = searchStatus.listen((value) {
        hasFoundCollaborator = value;
      });
    });
  }

  @override
  List<Object> get props => [];
}
