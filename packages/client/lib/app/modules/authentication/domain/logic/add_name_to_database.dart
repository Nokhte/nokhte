/// add_name_to_database.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AddNameToDatabase] class, a logic function in the
/// domain layer responsible for adding a name to the database. It extends
/// [AbstractFutureLogic] to handle asynchronous operations with the functional
/// paradigm as opposed to Try-Catch Blocks (Imperative Paradigm)
///
/// The [AddNameToDatabase] class takes an [AuthenticationContract] as a
/// dependency, which is  an interface that defines the methods for interacting
/// with the authentication functionality in the application.
///
/// The [call] method is overridden to perform the logic for adding a name to
/// the database. It returns a [Future] with the [Either] type, representing
/// either a [Failure] when an error occurs or a [NameCreationStatusEntity]
/// when the name is successfully added to the database. The [Either] type is
/// used to handle errors in a functional paradigm, where [Left] represents a
/// [Failure] and [Right] represents a successful result.
///
/// The [AbstractFutureLogic] class takes two type parameters: the return entity
/// type on the [Left] and the parameter entity type on the [Right]. In this
/// case, the [AddNameToDatabase] returns a [NameCreationStatusEntity] on the
/// [Right] and takes a [NoParams] on the [Left]. This ensures strict typing
/// and provides a clean separation of concerns.

import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';

class AddNameToDatabase
    extends AbstractFutureLogic<NameCreationStatusEntity, NoParams> {
  /// The [AuthenticationContract] dependency used for interacting with the authentication.
  final AuthenticationContract contract;

  /// Constructs an [AddNameToDatabase] instance with the specified [contract].
  AddNameToDatabase({required this.contract});

  /// Calls the [addNameToDatabase] method from the [AuthenticationContract].
  /// The method returns a [Future] with [Either] type.
  @override
  Future<Either<Failure, NameCreationStatusEntity>> call(
          NoParams params) async =>
      await contract.addNameToDatabase();
}
