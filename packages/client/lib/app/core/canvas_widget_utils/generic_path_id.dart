class GenericPathId<T> {
  final bool isInteractable;
  final int indexIdentifier;

  final T shapeTypes;

  final Function pathInformation;

  final Function fillInformation;

  GenericPathId({
    required this.isInteractable,
    required this.indexIdentifier,
    required this.shapeTypes,
    required this.pathInformation,
    required this.fillInformation,
  });
}
