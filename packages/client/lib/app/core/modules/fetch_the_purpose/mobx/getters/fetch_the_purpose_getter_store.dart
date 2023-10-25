// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/fetch_the_purpose/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'fetch_the_purpose_getter_store.g.dart';

class FetchThePurposeGetterStore = _FetchThePurposeGetterStoreBase
    with _$FetchThePurposeGetterStore;

abstract class _FetchThePurposeGetterStoreBase extends Equatable with Store {
  final FetchThePurpose logic;

  _FetchThePurposeGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollectivePurposeEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
