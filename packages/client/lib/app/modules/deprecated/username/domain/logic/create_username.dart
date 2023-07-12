// * Domain Imports
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/deprecated/username/domain/contracts/username_contract.dart';
import 'package:primala/app/modules/deprecated/username/domain/entities/username_status_entity.dart';
// * Core Imports
import 'package:primala/app/core/interfaces/logic.dart';

class CreateUsername
    extends AbstractFutureLogic<UsernameStatusEntity, CreateUserParams> {
  final UsernameContract contract;

  CreateUsername({required this.contract});

  @override
  Future<Either<Failure, UsernameStatusEntity>> call(
          CreateUserParams params) async =>
      await contract.createUsername(params.username);
}

class CreateUserParams extends Equatable {
  final String username;

  const CreateUserParams({required this.username});

  @override
  List<Object> get props => [username];
}
