import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class MarkdownTheTime
    implements AbstractFutureLogic<TimerMarkdownStatusEntity, NoParams> {
  final TimerContract contract;

  MarkdownTheTime({required this.contract});

  @override
  call(params) async => await contract.markdownTheTimer(params);
}
