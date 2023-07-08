// * Domain Imports
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/username/domain/contracts/username_contract.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
// * Core Imports
import 'package:primala/app/core/interfaces/logic.dart';

class CheckIfUsernameIsCreated
    extends AbstractFutureLogic<UsernameStatusEntity, NoParams> {
  final UsernameContract contract;

  CheckIfUsernameIsCreated({required this.contract});

  @override
  Future<Either<Failure, UsernameStatusEntity>> call(NoParams params) async =>
      await contract.checkIfUsernameIsCreated();
}
