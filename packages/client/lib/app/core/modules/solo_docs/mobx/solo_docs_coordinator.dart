// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';
part 'solo_docs_coordinator.g.dart';

class SoloDocsCoordinator = _SoloDocsCoordinatorBase with _$SoloDocsCoordinator;

abstract class _SoloDocsCoordinatorBase extends BaseMobxDBStore with Store {
  final CreateSoloDoc createSoloDocLogic;
  final GetSoloDoc getSoloDocLogic;
  final SealSoloDoc sealSoloDocLogic;
  final ShareSoloDoc shareSoloDocLogic;
  final SubmitSoloDoc submitSoloDocLogic;

  _SoloDocsCoordinatorBase({
    required this.createSoloDocLogic,
    required this.getSoloDocLogic,
    required this.sealSoloDocLogic,
    required this.shareSoloDocLogic,
    required this.submitSoloDocLogic,
  });

  @observable
  bool isCreated = false;

  @observable
  bool isSealed = false;

  @observable
  bool isShared = false;

  @observable
  bool isSubmitted = false;

  @observable
  String remoteDocContent = "";

  @action
  create(SoloDocTypes params) async {
    state = StoreState.loading;
    final res = await createSoloDocLogic.call(params);
    res.fold((failure) => errorUpdater(failure),
        (createStatus) => isCreated = createStatus);
  }

  @action
  getDoc(GetSoloDocParams params) async {
    state = StoreState.loading;
    final res = await getSoloDocLogic.call(params);
    res.fold((failure) => errorUpdater(failure),
        (docContent) => remoteDocContent = docContent);
  }

  @action
  seal() async {
    state = StoreState.loading;
    final res = await sealSoloDocLogic.call(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (sealStatus) => isSealed = sealStatus);
  }

  @action
  share() async {
    state = StoreState.loading;
    final res = await shareSoloDocLogic.call(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (shareStatus) => isShared = shareStatus);
  }

  @action
  submit(String params) async {
    state = StoreState.loading;
    final res = await submitSoloDocLogic.call(params);
    res.fold((failure) => errorUpdater(failure),
        (submitStatus) => isSubmitted = submitStatus);
  }

  @override
  List<Object> get props => [];
}
