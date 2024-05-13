import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_metadata/domain/domain.dart';

class GetUserMetadata
    implements AbstractFutureLogic<UserMetadataEntity, NoParams> {
  final UserMetadataContract contract;

  GetUserMetadata({required this.contract});

  @override
  call(params) async => await contract.getUserMetadata(params);
}
