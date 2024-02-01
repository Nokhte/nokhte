import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

class BaseGetSessionMetadata<T>
    implements AbstractFutureLogic<Stream<T>, NoParams> {
  final BasePresenceContract<T> contract;

  BaseGetSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.getSessionMetadata(params);
}
