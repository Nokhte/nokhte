// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
import 'package:nokhte_backend/working_perspectives_positioning.dart';
// * Mobx Codegen Inclusion
part 'fetch_perspectives_stream_store.g.dart';

class FetchPerspectivesStreamStore = _FetchPerspectivesStreamStoreBase
    with _$FetchPerspectivesStreamStore;

abstract class _FetchPerspectivesStreamStoreBase
    extends BaseMobxDBStore<NoParams, WorkingPerspectivesStreamEntity>
    with Store {
  @observable
  ObservableStream<PerspectivesPositioning> stream = ObservableStream(
    DefaultEntities.defaultPerspectivesStream,
  );

  final FetchPerspectivesStreamGetterStore getterStore;
  _FetchPerspectivesStreamStoreBase({required this.getterStore});

  @override
  @action
  Future<void> call(params) async {
    final result = await getterStore(params);
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (entity) {
      stream = ObservableStream(entity.stream);
      state = StoreState.loaded;
    });
  }
}
