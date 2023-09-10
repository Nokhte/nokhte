// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_presence_store.g.dart';

class GetCollaboratorPresenceStore = _GetCollaboratorPresenceStoreBase
    with _$GetCollaboratorPresenceStore;

abstract class _GetCollaboratorPresenceStoreBase extends BaseMobxDBStore<
    NoParams, CollaborativeDocCollaboratorPresenceEntity> with Store {
  final GetCollaboratorPresenceGetterStore getterStore;

  _GetCollaboratorPresenceStoreBase({required this.getterStore});

  @observable
  ObservableStream<bool> collaboratorPresence =
      ObservableStream<bool>(Stream.value(false));

  @override
  Future<void> call(NoParams params) async {
    final result = await getterStore();
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (presenceEntity) {
        collaboratorPresence = ObservableStream(presenceEntity.isPresent);
        state = StoreState.loaded;
      },
    );
  }
}
