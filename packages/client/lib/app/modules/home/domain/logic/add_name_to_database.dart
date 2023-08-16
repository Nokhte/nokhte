import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/home/domain/contracts/home_contract.dart';
import 'package:primala/app/modules/home/domain/entities/name_creation_status_entity.dart';

class AddNameToDatabase
    extends AbstractFutureLogic<NameCreationStatusEntity, NoParams> {
  final HomeContract contract;

  AddNameToDatabase({required this.contract});

  @override
  Future<Either<Failure, NameCreationStatusEntity>> call(
          NoParams params) async =>
      await contract.addNameToDatabase();
}
