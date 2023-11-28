// ignore_for_file: must_be_immutable, library_private_types_in_public_api, type_literal_in_constant_pattern
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
part 'get_collaborator_search_status_store.g.dart';

class GetCollaboratorSearchStatusStore = _GetCollaboratorSearchStatusStoreBase
    with _$GetCollaboratorSearchStatusStore;

abstract class _GetCollaboratorSearchStatusStoreBase extends Equatable
    with Store {
  final GetCollaboratorSearchStatus logic;

  @observable
  ObservableStream<CollaboratorSearchAndEntryStatus> searchStatus =
      ObservableStream(const Stream.empty());

  @observable
  String errorMessage = "";

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

  Future<void> call() async {
    final result = await logic(NoParams());
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (searchStatusEntity) {
      searchStatus =
          ObservableStream(searchStatusEntity.searchAndEntryStatusStream);
    });
  }

  @override
  List<Object> get props => [];
}
