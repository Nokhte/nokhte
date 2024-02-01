// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
part 'base_get_session_metadata_store.g.dart';

class BaseGetSessionMetadataStore<T> = _BaseGetSessionMetadataStoreBase<T>
    with _$BaseGetSessionMetadataStore<T>;

abstract class _BaseGetSessionMetadataStoreBase<T>
    extends BaseMobxDBStore<NoParams, Stream<T>> with Store {
  final BaseGetSessionMetadata<T> logic;
  _BaseGetSessionMetadataStoreBase({required this.logic});

  @observable
  double currentPhase = 0;

  @action
  setCurrentPhase(double newDouble) => currentPhase = newDouble;

  @observable
  double userPhase = 0;

  @observable
  double collaboratorPhase = 0.0;

  @observable
  bool userIsOnline = false;

  @observable
  bool userIsTalking = false;

  @observable
  bool collaboratorIsOnline = false;

  @observable
  bool collaboratorIsTalking = false;

  @computed
  bool get bothCollaboratorsAreInSyncAndOnline =>
      userIsOnline &&
      collaboratorIsOnline &&
      userPhase.isGreaterThanOrEqualTo(currentPhase) &&
      collaboratorPhase.isGreaterThanOrEqualTo(currentPhase);

  @computed
  bool get collaboratorHasMovedOn =>
      collaboratorPhase.isGreaterThan(currentPhase);

  @observable
  ObservableStream<T> sessionMetadata = ObservableStream(const Stream.empty());

  StreamSubscription streamSubscription =
      const Stream.empty().listen((event) {});

  dispose() async {
    await streamSubscription.cancel();
    await sessionMetadata.close();
  }
}
