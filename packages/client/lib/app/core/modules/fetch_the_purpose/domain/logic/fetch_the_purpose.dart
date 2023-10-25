import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/fetch_the_purpose/domain/domain.dart';

class FetchThePurpose
    implements AbstractFutureLogic<CollectivePurposeEntity, NoParams> {
  final FetchThePurposeContract contract;

  FetchThePurpose({required this.contract});

  @override
  call(params) async => await contract.fetchThePurpose(params);
}
