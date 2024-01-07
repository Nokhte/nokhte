import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';

class GetDeepLinkURL
    implements AbstractFutureLogic<DeepLinkUrlEntity, GetDeepLinkURLParams> {
  final DeepLinksContract contract;

  GetDeepLinkURL({required this.contract});

  @override
  call(params) async => await contract.getDeepLinkURL(params);
}

class GetDeepLinkURLParams extends Equatable {
  final DeepLinkTypes type;

  const GetDeepLinkURLParams({
    required this.type,
  });

  @override
  List<Object> get props => [];
}
