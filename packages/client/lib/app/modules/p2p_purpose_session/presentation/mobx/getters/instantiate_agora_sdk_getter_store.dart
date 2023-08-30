// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'instantiate_agora_sdk_getter_store.g.dart';

class InstantiateAgoraSdkGetterStore = _InstantiateAgoraSdkGetterStoreBase
    with _$InstantiateAgoraSdkGetterStore;

abstract class _InstantiateAgoraSdkGetterStoreBase extends Equatable
    with Store {
  InstantiateAgoraSdk instantiateAgoraSdkLogic;
  _InstantiateAgoraSdkGetterStoreBase({
    required this.instantiateAgoraSdkLogic,
  });

  Future<Either<Failure, AgoraSdkStatusEntity>> call() async =>
      await instantiateAgoraSdkLogic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
