// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
part 'solo_doc_coordinator.g.dart';

class SoloDocCoordinator = _SoloDocCoordinatorBase with _$SoloDocCoordinator;

abstract class _SoloDocCoordinatorBase extends BaseMobxDBStore with Store {
  final CreateSoloDoc createSoloDoc;
  final GetSoloDoc getSoloDoc;
  final SealSoloDoc sealSoloDoc;
  final ShareSoloDoc shareSoloDoc;
  final SubmitSoloDoc submitSoloDoc;

  _SoloDocCoordinatorBase({
    required this.createSoloDoc,
    required this.getSoloDoc,
    required this.sealSoloDoc,
    required this.shareSoloDoc,
    required this.submitSoloDoc,
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
  create(CreateSoloDocParams params) async {
    state = StoreState.loading;
    final res = await createSoloDoc.call(params);
    res.fold((failure) => errorUpdater(failure),
        (createStatus) => isCreated = createStatus);
  }

  @action
  getDoc(GetSoloDocParams params) async {
    state = StoreState.loading;
    final res = await getSoloDoc.call(params);
    res.fold((failure) => errorUpdater(failure),
        (docContent) => remoteDocContent = docContent);
  }

  @action
  seal(NoParams params) async {
    state = StoreState.loading;
    final res = await sealSoloDoc.call(params);
    res.fold((failure) => errorUpdater(failure),
        (sealStatus) => isSealed = sealStatus);
  }

  @action
  share(NoParams params) async {
    state = StoreState.loading;
    final res = await shareSoloDoc.call(params);
    res.fold((failure) => errorUpdater(failure),
        (shareStatus) => isShared = shareStatus);
  }

  @action
  submit(SubmitSoloDocParams params) async {
    state = StoreState.loading;
    final res = await submitSoloDoc.call(params);
    res.fold((failure) => errorUpdater(failure),
        (submitStatus) => isSubmitted = submitStatus);
  }

  @override
  List<Object> get props => [];
}
