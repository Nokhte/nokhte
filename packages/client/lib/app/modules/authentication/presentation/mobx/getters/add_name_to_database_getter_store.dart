/// add_name_to_database_getter_store.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AddNameToDatabaseGetterStore] class, a MobX getter
/// store that retrieves data from the domain layer. The store extends
/// [_AddNameToDatabaseGetterStoreBase] and interacts with the
///  [AddNameToDatabase] logic for the [AddNameToDatabaseStore]
///
/// The [AddNameToDatabaseGetterStore] contains an observable [addNameLogic]
/// variable that holds the [AddNameToDatabase] logic instance. It provides a
/// [call] method that asynchronously invokes the [addNameLogic] to add a name
/// to the database by passing a [NoParams] object. The method returns a
/// [Future] that resolves to either [Right] with a [NameCreationStatusEntity]
/// or [Left] with a [Failure] indicating the result of the operation.
///
/// Note: The ignore_for_file directive is used to suppress warnings about
/// library_private_types_in_public_api and must_be_immutable.

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';
import 'package:primala/app/modules/authentication/domain/logic/add_name_to_database.dart';
// * Mobx Codegen Inclusion
part 'add_name_to_database_getter_store.g.dart';

/// [AddNameToDatabaseGetterStore] is a MobX getter store that retrieves data
/// from the domain layer.
class AddNameToDatabaseGetterStore = _AddNameToDatabaseGetterStoreBase
    with _$AddNameToDatabaseGetterStore;

/// [_AddNameToDatabaseGetterStoreBase] is the base class that extends
/// [Equatable] and interacts with the [AddNameToDatabase] logic.
abstract class _AddNameToDatabaseGetterStoreBase extends Equatable with Store {
  final AddNameToDatabase addNameLogic;

  _AddNameToDatabaseGetterStoreBase({required this.addNameLogic});

  /// The [call] method asynchronously invokes the [addNameLogic] to add a name
  /// to the database by passing a [NoParams] object. The method returns a
  /// [Future] that resolves to either [Right] with a [NameCreationStatusEntity]
  /// or [Left] with a [Failure].
  Future<Either<Failure, NameCreationStatusEntity>> call() async =>
      await addNameLogic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
