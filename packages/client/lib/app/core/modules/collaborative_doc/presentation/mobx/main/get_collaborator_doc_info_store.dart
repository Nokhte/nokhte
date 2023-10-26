// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:nokhte_backend/working_collaborative_documents.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_doc_info_store.g.dart';

class GetCollaboratorDocInfoStore = _GetCollaboratorDocInfoStoreBase
    with _$GetCollaboratorDocInfoStore;

abstract class _GetCollaboratorDocInfoStoreBase
    extends BaseMobxDBStore<NoParams, CollaborativeDocCollaboratorInfoEntity>
    with Store {
  final GetCollaboratorDocInfoGetterStore getterStore;

  @observable
  ObservableStream<CollaboratorDocInfo> collaboratorDocinfo = ObservableStream(
    DefaultEntities.defaultCollaboratorDocInfo,
  );

  _GetCollaboratorDocInfoStoreBase({
    required this.getterStore,
  });

  @override
  Future<void> call(params) async {
    final result = await getterStore();
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (docContentEntity) {
        collaboratorDocinfo =
            ObservableStream(docContentEntity.collaboratorDocInfo);
        state = StoreState.loaded;
      },
    );
  }
}
