// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/scheduling/presentation/presentation.dart';
import 'package:nokhte_backend/working_collaborative_scheduling.dart';
// * Mobx Codegen Inclusion
part 'get_collaborators_date_and_time_store.g.dart';

class GetCollaboratorsDateAndTimeStore = _GetCollaboratorsDateAndTimeStoreBase
    with _$GetCollaboratorsDateAndTimeStore;

abstract class _GetCollaboratorsDateAndTimeStoreBase
    extends BaseMobxDBStore<NoParams, CollaboratorsDateAndTime> with Store {
  final GetCollaboratorsDateAndTimeGetterStore getterStore;
  _GetCollaboratorsDateAndTimeStoreBase({required this.getterStore});

  @observable
  ObservableStream<CollaboratorsDateAndTime> chosenTimeAndDay =
      ObservableStream(
    DefaultEntities.collaboratorsChosenTimeAndDay,
  );

  @override
  Future<void> call(params) async {
    final result = await getterStore(params);
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (entity) {
        chosenTimeAndDay = ObservableStream(entity.dateAndTime);
        state = StoreState.loaded;
      },
    );
  }
}
