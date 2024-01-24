// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  final UserInformationCoordinator userInformation;
  final InterpretCollaboratorCodeDeepLink interpretCollaboratorCode;

  _ListenForOpenedDeepLinkStoreBase({
    required this.logic,
    required this.interpretCollaboratorCode,
    required this.userInformation,
  }) {
    interpretedDeepLinkReactor();
  }

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
        if (linkType == DeepLinkPrefixes.collaboratorCode) {
          final getUserInfo = userInformation.getUserInfoStore;
          await getUserInfo(NoParams());
          final res = interpretCollaboratorCode(
            InterpretCollaboratorCodeDeepLinkParams.fromUserJourneyInfo(
              getUserInfo.entity,
              splitLink[1],
            ),
          );
          path = res.path;
          additionalMetadata = ObservableMap.of(res.additionalMetadata);
        }
      }
    });
  }

  interpretedDeepLinkReactor() => reaction((p0) => path, (p0) {
        if (p0.isNotEmpty) {
          Modular.to.navigate(path, arguments: additionalMetadata);
        }
      });

  @override
  List<Object?> get props => [];
}
