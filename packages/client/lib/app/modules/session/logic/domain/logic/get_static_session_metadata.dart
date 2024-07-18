import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/logic/domain/domain.dart';

class GetStaticSessionMetadata
    implements AbstractFutureLogic<StaticSessionMetadataEntity, NoParams> {
  final SessionPresenceContract contract;

  GetStaticSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.getSTSessionMetadata(params);
}
