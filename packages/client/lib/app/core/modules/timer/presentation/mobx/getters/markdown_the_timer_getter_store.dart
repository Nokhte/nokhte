// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
part 'markdown_the_timer_getter_store.g.dart';

class MarkdownTheTimerGetterStore = _MarkdownTheTimerGetterStoreBase
    with _$MarkdownTheTimerGetterStore;

abstract class _MarkdownTheTimerGetterStoreBase extends Equatable with Store {
  final MarkdownTheTimer logic;

  _MarkdownTheTimerGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, TimerMarkdownStatusEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
