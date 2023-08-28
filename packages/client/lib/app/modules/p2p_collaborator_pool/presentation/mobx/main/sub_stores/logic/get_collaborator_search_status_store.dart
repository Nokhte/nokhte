// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_search_status_store.g.dart';

class GetCollaboratorSearchStatusStore = _GetCollaboratorSearchStatusStoreBase
    with _$GetCollaboratorSearchStatusStore;

abstract class _GetCollaboratorSearchStatusStoreBase extends Equatable
    with Store {
  final GetCollaboratorSearchStatusStore collaboratorSearchStatusGetter;

  @observable
  Stream<bool> searchStatus = Stream.value(false);

  @observable
  String errorMessage = "";

  @observable
  StoreState state = StoreState.initial;

  _GetCollaboratorSearchStatusStoreBase({
    required this.collaboratorSearchStatusGetter,
  });

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkConnectionFailure:
        return FailureConstants.internetConnectionFailureMsg;
      default:
        return FailureConstants.genericFailureMsg;
    }
  }

  void call(Either<Failure, CollaboratorSearchStatusEntity> result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (searchStatusEntity) {
      searchStatus = searchStatusEntity.isFound;
    });
  }

  /// test this infra in the morning and then round out the impl

  @override
  List<Object> get props => [];
}
