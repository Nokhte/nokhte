import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class UpdateUserDelta extends AbstractFutureLogic<
    CollaborativeDocDeltaUpdaterStatusEntity, UpdateUserDeltaParams> {
  final CollaborativeDocContract contract;

  UpdateUserDelta({required this.contract});

  @override
  call(params) async =>
      await contract.updateUserDelta(newDelta: params.newDelta);
}

class UpdateUserDeltaParams extends Equatable {
  final int newDelta;

  const UpdateUserDeltaParams({required this.newDelta});

  @override
  List<Object> get props => [newDelta];
}
