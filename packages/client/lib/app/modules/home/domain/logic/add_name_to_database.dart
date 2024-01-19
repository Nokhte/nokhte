import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';

class AddNameToDatabase extends AbstractFutureLogic<bool, NoParams> {
  final HomeContract contract;

  AddNameToDatabase({required this.contract});

  @override
  call(NoParams params) async => await contract.addNameToDatabase(params);
}
