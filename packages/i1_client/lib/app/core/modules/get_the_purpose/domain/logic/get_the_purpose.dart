import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/domain/domain.dart';

class GetThePurpose
    implements AbstractFutureLogic<CollectivePurposeEntity, NoParams> {
  final GetThePurposeContract contract;

  GetThePurpose({required this.contract});

  @override
  call(params) async => await contract.getThePurpose(params);
}
