import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

class GetNokhteSessionArtifacts
    implements
        AbstractFutureLogic<List<NokhteSessionArtifactEntity>, NoParams> {
  final StorageContract contract;

  GetNokhteSessionArtifacts({required this.contract});

  @override
  call(params) async => await contract.getNokhteSessionArtifacts(params);
}
