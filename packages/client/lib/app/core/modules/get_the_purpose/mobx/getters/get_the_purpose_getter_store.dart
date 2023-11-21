// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/domain/domain.dart';
part 'get_the_purpose_getter_store.g.dart';

class GetThePurposeGetterStore = _GetThePurposeGetterStoreBase
    with _$GetThePurposeGetterStore;

abstract class _GetThePurposeGetterStoreBase extends Equatable with Store {
  final GetThePurpose logic;

  _GetThePurposeGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollectivePurposeEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
