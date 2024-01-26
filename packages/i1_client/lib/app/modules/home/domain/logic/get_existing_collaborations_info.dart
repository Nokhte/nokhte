import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';

class GetExistingCollaborationsInfo
    implements AbstractFutureLogic<ExistingCollaborationsInfoEntity, NoParams> {
  final HomeContract contract;

  GetExistingCollaborationsInfo({required this.contract});

  @override
  call(params) async => await contract.getExistingCollaborationInfo(params);
}
