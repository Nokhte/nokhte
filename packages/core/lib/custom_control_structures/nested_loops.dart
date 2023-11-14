class NestedLoops {
  static void twoDifferentLists<OuterLoop, InnerLoop>(
    List<OuterLoop> list1,
    List<InnerLoop> list2,
    Function(int, int) callback,
  ) {
    list1.asMap().forEach((outerIndex, item1) {
      list2.asMap().forEach((innerIndex, item2) {
        callback(outerIndex, innerIndex);
      });
    });
  }

  static void nestedList({
    required List theList,
    required Function(int, int) callback,
    String? optionalNestedListObjectKey,
  }) {
    theList.asMap().forEach((outterIndex, item1) {
      final List list2 = theList[outterIndex]?[optionalNestedListObjectKey];
      list2.asMap().forEach((innerIndex, item2) {
        callback(outterIndex, innerIndex);
      });
    });
  }
}
