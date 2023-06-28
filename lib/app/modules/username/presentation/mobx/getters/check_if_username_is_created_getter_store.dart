// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
import 'package:primala/app/modules/username/domain/logic/check_if_username_is_created.dart';
// * Mobx Codegen Inclusion
part 'check_if_username_is_created_getter_store.g.dart';

class CheckIfUsernameIsCreatedGetterStore = _CheckIfUsernameIsCreatedGetterStoreBase
    with _$CheckIfUsernameIsCreatedGetterStore;

abstract class _CheckIfUsernameIsCreatedGetterStoreBase extends Equatable
    with Store {
  // ok what gets included here
  final CheckIfUsernameIsCreated checkUsernameLogic;

  _CheckIfUsernameIsCreatedGetterStoreBase({
    required CheckIfUsernameIsCreated checkLogic,
  }) : checkUsernameLogic = checkLogic;

  @observable
  StoreState state = StoreState.initial;

  Future<Either<Failure, UsernameStatusEntity>> call() async {
    return await checkUsernameLogic(NoParams());
  }

  @override
  List<Object> get props => [state];
}
