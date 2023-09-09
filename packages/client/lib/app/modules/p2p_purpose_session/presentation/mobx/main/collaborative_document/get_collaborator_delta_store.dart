// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_delta_store.g.dart';

class GetCollaboratorDeltaStore = _GetCollaboratorDeltaStoreBase
    with _$GetCollaboratorDeltaStore;

abstract class _GetCollaboratorDeltaStoreBase
    extends BaseMobxDBStore<NoParams, CollaborativeDocCollaboratorDeltaEntity>
    with Store {
  final GetCollaboratorDeltaGetterStore getterStore;

  _GetCollaboratorDeltaStoreBase({required this.getterStore});

  @observable
  ObservableStream<int> collaboratorDelta =
      ObservableStream<int>(Stream.value(-1));

  @override
  Future<void> call(params) async {
    final result = await getterStore.call();
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (deltaEntity) {
        collaboratorDelta = ObservableStream<int>(deltaEntity.delta);
        state = StoreState.loaded;
      },
    );
  }
}
