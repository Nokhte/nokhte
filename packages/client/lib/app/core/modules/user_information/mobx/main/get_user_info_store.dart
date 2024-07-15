// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
part 'get_user_info_store.g.dart';

class GetUserInfoStore = _GetUserInfoStoreBase with _$GetUserInfoStore;

abstract class _GetUserInfoStoreBase
    with Store, BaseMobxLogic<NoParams, UserJourneyInfoEntity> {
  final BaseGetUserInfo logic;
  _GetUserInfoStoreBase({required this.logic}) {
    initBaseLogicActions();
  }

  @observable
  bool hasAccessedQrCode = false;

  @observable
  bool hasAccessedQrCodeScanner = false;

  @observable
  bool hasDoneASession = false;

  @observable
  bool hasEnteredStorage = false;

  @observable
  bool isOnMostRecentVersion = true;

  @observable
  String userUID = "";

  @observable
  UserJourneyInfoEntity entity = UserJourneyInfoEntity.initial();

  @observable
  BaseFutureStore<UserJourneyInfoEntity> futureStore = BaseFutureStore(
    baseEntity: Right(UserJourneyInfoEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(UserJourneyInfoEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      setErrorMessage(mapFailureToMessage(failure));
      setState(StoreState.initial);
    }, (journeyInfoEntity) {
      entity = journeyInfoEntity;
      isOnMostRecentVersion = journeyInfoEntity.isOnMostRecentVersion;
      hasAccessedQrCode = journeyInfoEntity.hasAccessedQrCode;
      hasAccessedQrCodeScanner = journeyInfoEntity.hasAccessedQrCodeScanner;
      hasEnteredStorage = journeyInfoEntity.hasEnteredStorage;
      hasDoneASession = journeyInfoEntity.hasCompletedASession;
      userUID = journeyInfoEntity.userUID;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    setState(StoreState.loading);
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    setState(StoreState.loaded);
  }

  @computed
  bool get hasDoneEitherQrFlow => hasAccessedQrCode || hasAccessedQrCodeScanner;
}
