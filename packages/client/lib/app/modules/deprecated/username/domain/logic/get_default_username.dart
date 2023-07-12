// * Domain Imports
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/deprecated/username/domain/contracts/username_contract.dart';
import 'package:primala/app/modules/deprecated/username/domain/entities/default_username_entity.dart';
// * Core Imports
import 'package:primala/app/core/interfaces/logic.dart';

class GetDefaultUsername
    extends AbstractFutureLogic<DefaultUsernameEntity, NoParams> {
  final UsernameContract contract;

  GetDefaultUsername({required this.contract});

  @override
  Future<Either<Failure, DefaultUsernameEntity>> call(NoParams params) async =>
      await contract.getDefaultUsername();
}
