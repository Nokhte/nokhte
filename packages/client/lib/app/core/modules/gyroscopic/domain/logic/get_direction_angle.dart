import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class GetDirectionAngle
    implements AbstractFutureLogic<DirectionAngleEntity, NoParams> {
  final GyroscopicContract contract;

  GetDirectionAngle({required this.contract});

  @override
  call(params) async => await contract.getDirectionAngle(params);
}
