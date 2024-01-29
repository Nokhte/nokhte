// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/coordinators/user_information_coordinator.dart';
part 'listen_for_opened_deep_link_store.g.dart';

class ListenForOpenedDeepLinkStore = _ListenForOpenedDeepLinkStoreBase
    with _$ListenForOpenedDeepLinkStore;

abstract class _ListenForOpenedDeepLinkStoreBase extends Equatable with Store {
  final ListenForOpenedDeepLink logic;
  final InterpretNokhteSessionDeepLink interpretNokhteSessionDeepLink;
  final UserInformationCoordinator userInformation;
  final InterpretCollaboratorCodeDeepLink interpretCollaboratorCode;

  _ListenForOpenedDeepLinkStoreBase({
    required this.logic,
    required this.interpretCollaboratorCode,
    required this.userInformation,
    required this.interpretNokhteSessionDeepLink,
  });

  @observable
  ObservableStream<Map> deepLinkSream = ObservableStream(
    const Stream.empty(),
  );

  @observable
  String path = "";

  @observable
  ObservableMap additionalMetadata = ObservableMap.of({});

  @action
  call(NoParams params) {
    final result = logic(NoParams());
    deepLinkSream = ObservableStream(result);
    deepLinkSream.listen((value) async {
      if (value["\$canonical_identifier"] != null) {
        final List<String> splitLink =
            value["\$canonical_identifier"].split('/');
        final String linkType = splitLink.first;
        final getUserInfo = userInformation.getUserInfoStore;
        await getUserInfo(NoParams());
        if (linkType == DeepLinkPrefixes.collaboratorCode) {
          final res = interpretCollaboratorCode(
            InterpretCollaboratorCodeDeepLinkParams.fromUserJourneyInfo(
              getUserInfo.entity,
              splitLink[1],
            ),
          );
          path = res.path;
          additionalMetadata = ObservableMap.of(res.additionalMetadata);
        } else if (linkType == DeepLinkPrefixes.nokhteCode) {
          final res = interpretNokhteSessionDeepLink(
            InterpretNokhteSessionDeepLinkParams(
              deepLinkUID: splitLink[1],
              usersUID: getUserInfo.entity.userUID,
            ),
          );
          path = res.path;
          additionalMetadata = ObservableMap.of(res.additionalMetadata);
        }
      }
    });
  }

  @override
  List<Object?> get props => [];
}
