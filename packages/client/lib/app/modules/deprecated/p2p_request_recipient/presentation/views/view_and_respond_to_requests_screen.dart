// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/main/load_the_requests_store.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/main/respond_to_a_request_store.dart';

class ViewAndRespondToRequestsScreen extends StatefulWidget {
  final LoadTheRequestsStore loadRequestsStore;
  final RespondToARequestStore respondToARequestStore;
  const ViewAndRespondToRequestsScreen({
    Key? key,
    required this.respondToARequestStore,
    required this.loadRequestsStore,
  }) : super(key: key);

  @override
  _ViewAndRespondToRequestsScreenState createState() =>
      _ViewAndRespondToRequestsScreenState(
        loadRequestsStore: loadRequestsStore,
        respondToARequestStore: respondToARequestStore,
      );
}

class _ViewAndRespondToRequestsScreenState
    extends State<ViewAndRespondToRequestsScreen> {
  final LoadTheRequestsStore loadRequestsStore;
  final RespondToARequestStore respondToARequestStore;

  _ViewAndRespondToRequestsScreenState({
    required this.loadRequestsStore,
    required this.respondToARequestStore,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
