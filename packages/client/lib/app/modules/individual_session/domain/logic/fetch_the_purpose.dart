import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/individual_session/domain/domain.dart';

class FetchThePurpose
    implements AbstractFutureLogic<CollectivePurposeEntity, NoParams> {
  final IndividualSessionContract contract;

  FetchThePurpose({required this.contract});

  @override
  call(params) async => await contract.fetchThePurpose(params);
}
