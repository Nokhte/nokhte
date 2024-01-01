import 'package:equatable/equatable.dart';

class CollaboratorPhraseIDs extends Equatable {
  final int adjectiveID;
  final int nounID;

  const CollaboratorPhraseIDs({
    required this.adjectiveID,
    required this.nounID,
  });

  static CollaboratorPhraseIDs get initial =>
      const CollaboratorPhraseIDs(adjectiveID: -1, nounID: -1);

  @override
  List<Object> get props => [adjectiveID, nounID];
}
