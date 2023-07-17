class GenericPathId<T> {
  final bool isInteractable;

  /// * starts @ 0 & goes up by 1 for each shape type
  final int indexIdentifier;

  /// * recommended that you define a custom enum
  /// * in a separate file, then import and pass it
  /// * through the constructor
  /// *
  final T shapeTypes;

  /// * make sure that a `Path` type is returned from
  /// * form this function
  final Function pathInformation;

  /// * make sure that a `Paint` type is returned
  /// * this can be any type of shader or solid color
  final Function fillInformation;

  GenericPathId({
    required this.isInteractable,
    required this.indexIdentifier,
    required this.shapeTypes,
    required this.pathInformation,
    required this.fillInformation,
  });
}
