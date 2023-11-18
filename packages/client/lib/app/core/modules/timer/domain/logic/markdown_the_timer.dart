import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class MarkdownTheTimer
    implements AbstractFutureLogic<TimerMarkdownStatusEntity, NoParams> {
  final TimerContract contract;

  MarkdownTheTimer({required this.contract});

  @override
  call(params) async => await contract.markdownTheTimer(params);
}
