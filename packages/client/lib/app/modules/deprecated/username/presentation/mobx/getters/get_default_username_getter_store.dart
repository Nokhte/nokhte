// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/deprecated/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/modules/deprecated/username/domain/logic/get_default_username.dart';
// * Mobx Codegen Inclusion
part 'get_default_username_getter_store.g.dart';

class GetDefaultUsernameGetterStore = _GetDefaultUsernameGetterStoreBase
    with _$GetDefaultUsernameGetterStore;

abstract class _GetDefaultUsernameGetterStoreBase extends Equatable with Store {
  final GetDefaultUsername getDefaultUsernameLogic;

  _GetDefaultUsernameGetterStoreBase({required GetDefaultUsername defaultLogic})
      : getDefaultUsernameLogic = defaultLogic;

  @observable
  StoreState state = StoreState.initial;

  Future<Either<Failure, DefaultUsernameEntity>> call() async {
    return await getDefaultUsernameLogic(NoParams());
  }

  @override
  List<Object> get props => [state];
}
