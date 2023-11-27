// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
part 'get_collaborative_doc_content_store.g.dart';

class GetCollaborativeDocContentStore = _GetCollaborativeDocContentStoreBase
    with _$GetCollaborativeDocContentStore;

abstract class _GetCollaborativeDocContentStoreBase
    extends BaseMobxDBStore<NoParams, CollaborativeDocContentEntity>
    with Store {
  final GetCollaborativeDocContent logic;

  _GetCollaborativeDocContentStoreBase({
    required this.logic,
  });

  @observable
  ObservableStream<DocInfoContent> docContent = ObservableStream(
    DefaultEntities.defaultDocContentEntity,
  );

  @override
  Future<void> call(params) async {
    final result = await logic(NoParams());
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (docContentEntity) {
        docContent = ObservableStream(docContentEntity.docContent);
        state = StoreState.loaded;
      },
    );
  }
}
