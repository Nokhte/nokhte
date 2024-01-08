// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
part 'deep_links_coordinator.g.dart';

class DeepLinksCoordinator = _DeepLinksCoordinatorBase
    with _$DeepLinksCoordinator;

abstract class _DeepLinksCoordinatorBase extends Equatable with Store {
  final GetDeepLinkURLStore getDeepLinkURL;
  final ListenForOpenedDeepLinkStore listenForOpenedDeepLink;
  final SendDeepLinkStore sendDeepLink;

  _DeepLinksCoordinatorBase({
    required this.getDeepLinkURL,
    required this.listenForOpenedDeepLink,
    required this.sendDeepLink,
  });

  @override
  List<Object> get props => [];
}
