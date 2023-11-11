// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/entities/name_creation_status_entity.dart';
import 'package:nokhte/app/modules/home/domain/logic/add_name_to_database.dart';
part 'add_name_to_database_getter_store.g.dart';

class AddNameToDatabaseGetterStore = _AddNameToDatabaseGetterStoreBase
    with _$AddNameToDatabaseGetterStore;

abstract class _AddNameToDatabaseGetterStoreBase extends Equatable with Store {
  final AddNameToDatabase addNameLogic;

  _AddNameToDatabaseGetterStoreBase({required this.addNameLogic});

  Future<Either<Failure, NameCreationStatusEntity>> call() async =>
      await addNameLogic(NoParams());

  @override
  List<Object> get props => [];
}
