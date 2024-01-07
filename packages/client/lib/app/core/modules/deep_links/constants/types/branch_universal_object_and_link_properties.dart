import 'package:equatable/equatable.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

class BranchUniversalObjectAndLinkProperties extends Equatable {
  final BranchUniversalObject universalObject;
  final BranchLinkProperties linkProperties;

  const BranchUniversalObjectAndLinkProperties({
    required this.universalObject,
    required this.linkProperties,
  });

  @override
  List<Object> get props => [universalObject, linkProperties];
}
