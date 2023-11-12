class NestedLoop {
  static void execute<OuterLoop, InnerLoop>(
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
}
