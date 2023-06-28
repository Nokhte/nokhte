// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Domain Imports
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
import 'package:primala/app/modules/username/domain/logic/create_username.dart';
// * Core Imports
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/mobx/store_state.dart';
// *** Mobx Codegen Inclusion
part 'create_username_getter_store.g.dart';

class CreateUsernameGetterStore = _CreateUsernameGetterStoreBase
    with _$CreateUsernameGetterStore;

abstract class _CreateUsernameGetterStoreBase extends Equatable with Store {
  // declare the logic bindings
  final CreateUsername createUsernameLogic;

  _CreateUsernameGetterStoreBase({required CreateUsername createLogic})
      : createUsernameLogic = createLogic;

  @observable
  StoreState state = StoreState.initial;

  Future<Either<Failure, UsernameStatusEntity>> call(String username) async {
    return await createUsernameLogic(CreateUserParams(username: username));
  }

  @override
  List<Object> get props => [state];
}
