import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_metadata/domain/domain.dart';

class AddUserMetadata implements AbstractFutureLogic<bool, NoParams> {
  final UserMetadataContract contract;

  AddUserMetadata({required this.contract});

  @override
  call(params) async => await contract.addUserMetadata(params);
}
