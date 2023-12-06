// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
import 'package:nokhte_backend/tables/working_perspectives_positioning.dart';
part 'get_perspectives_stream_store.g.dart';

class GetPerspectivesStreamStore = _GetPerspectivesStreamStoreBase
    with _$GetPerspectivesStreamStore;

abstract class _GetPerspectivesStreamStoreBase
    extends BaseMobxDBStore<NoParams, WorkingPerspectivesStreamEntity>
    with Store {
  @observable
  ObservableStream<PerspectivesPositioning> stream = ObservableStream(
    DefaultEntities.defaultPerspectivesStream,
  );

  final GetPerspectivesStreamGetterStore getterStore;
  _GetPerspectivesStreamStoreBase({required this.getterStore});

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
