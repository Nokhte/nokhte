// ignore_for_file: must_be_immutable, library_private_types_in_public_api, argument_type_not_assignable_to_error_handler
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
part 'get_tilt_stream_store.g.dart';

class GetTiltStreamStore = _GetTiltStreamStoreBase with _$GetTiltStreamStore;

abstract class _GetTiltStreamStoreBase extends BaseMobxDBStore with Store {
  final GetTiltStream logic;
  _GetTiltStreamStoreBase({
    required this.logic,
  });

  @observable
  PhoneHoldingState holdingState = PhoneHoldingState.initial;

  @observable
  ObservableStream<PhoneHoldingState> stream =
      ObservableStream(Stream.value(PhoneHoldingState.initial));

  StreamSubscription streamSubscription =
      const Stream.empty().listen((event) {});

  @action
  listen(NoParams params) {
    stream = ObservableStream(logic(NoParams()));
    streamSubscription = stream.listen((value) => holdingState = value);
    streamSubscription.onError((e) {
      holdingState = PhoneHoldingState.noGryoscope;
    });
  }

  @action
  dispose() async {
    streamSubscription.cancel();
    await stream.close();
  }
}
