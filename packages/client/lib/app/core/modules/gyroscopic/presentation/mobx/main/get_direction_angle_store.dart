// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
part 'get_direction_angle_store.g.dart';

class GetDirectionAngleStore = _GetDirectionAngleStoreBase
    with _$GetDirectionAngleStore;

abstract class _GetDirectionAngleStoreBase
    extends BaseMobxDBStore<NoParams, DirectionAngleEntity> with Store {
  final GetDirectionAngleGetterStore getterStore;
  _GetDirectionAngleStoreBase({required this.getterStore});

  @observable
  ObservableStream<int> userDirection = ObservableStream(
    DefaultEntities.defaultCompassEvent,
  );

  @override
  Future<void> call(params) async {
    final result = await getterStore(NoParams());
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (entity) {
        userDirection = ObservableStream(entity.angleStream);
        state = StoreState.loaded;
      },
    );
  }
}
