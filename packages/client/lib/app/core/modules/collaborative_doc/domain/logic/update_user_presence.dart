import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class UpdateUserPresence extends AbstractFutureLogic<
    CollaborativeDocPresenceUpdaterStatusEntity, UpdateUserPresenceParams> {
  final CollaborativeDocContract contract;

  UpdateUserPresence({required this.contract});

  @override
  call(params) async =>
      await contract.updateUserPresence(newPresence: params.newPresence);
}

class UpdateUserPresenceParams extends Equatable {
  final bool newPresence;

  const UpdateUserPresenceParams({required this.newPresence});

  @override
  List<Object> get props => [newPresence];
}
