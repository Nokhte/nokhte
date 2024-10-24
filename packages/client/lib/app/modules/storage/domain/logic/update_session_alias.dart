import 'package:equatable/equatable.dart';

import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

class UpdateSessionAlias
    implements AbstractFutureLogic<bool, UpdateSessionAliasParams> {
  final StorageContract contract;

  UpdateSessionAlias({required this.contract});

  @override
  call(params) async => await contract.updateSessionAlias(params);
}

class UpdateSessionAliasParams extends Equatable {
  final String sessionUID;
  final String newAlias;
  const UpdateSessionAliasParams({
    required this.sessionUID,
    required this.newAlias,
  });

  @override
  List<Object> get props => [sessionUID, newAlias];
}
