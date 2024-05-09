import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_metadata/domain/domain.dart';

class AddMetadata implements AbstractFutureLogic<bool, NoParams> {
  final UserMetadataContract contract;

  AddMetadata({required this.contract});

  @override
  call(params) async => await contract.addMetadata(params);
}
