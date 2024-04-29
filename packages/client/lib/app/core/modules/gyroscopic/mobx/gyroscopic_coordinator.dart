// ignore_for_file: must_be_immutable, library_private_types_in_public_api, argument_type_not_assignable_to_error_handler
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
part 'gyroscopic_coordinator.g.dart';

class GyroscopicCoordinator = _GyroscopicCoordinatorBase
    with _$GyroscopicCoordinator;

abstract class _GyroscopicCoordinatorBase extends BaseMobxDBStore with Store {
  final GetTiltStream getTiltStreamLogic;
  final CheckIfDeviceHasGyroscope checkIfDeviceHasGyroscopeLogic;
  _GyroscopicCoordinatorBase({
    required this.getTiltStreamLogic,
    required this.checkIfDeviceHasGyroscopeLogic,
  });

  @observable
  PhoneHoldingState holdingState = PhoneHoldingState.initial;

  @observable
  bool deviceHasGyroscope = true;

  @observable
  ObservableStream<PhoneHoldingState> stream =
      ObservableStream(Stream.value(PhoneHoldingState.initial));

  StreamSubscription streamSubscription =
      const Stream.empty().listen((event) {});

  @action
  listen(NoParams params) async {
    await checkIfDeviceHasGyroscope();
    if (deviceHasGyroscope) {
      stream = ObservableStream(getTiltStreamLogic(NoParams()));
      streamSubscription = stream.listen((value) => holdingState = value);
      streamSubscription.onError((e) {
        holdingState = PhoneHoldingState.noGryoscope;
      });
    }
  }

  @action
  checkIfDeviceHasGyroscope() async {
    deviceHasGyroscope = await checkIfDeviceHasGyroscopeLogic(NoParams());
  }

  @action
  dispose() async {
    streamSubscription.cancel();
    await stream.close();
  }
}
