mixin AdjacentNumbers {
  static List<int> getAdjacentNumbers(int max, int index,
      {bool includeIndex = true}) {
    List<int> adjacentNumbers = [];
    int prevNumber = index == 1 ? max : index - 1;
    int nextNumber = index == max ? 1 : index + 1;
    adjacentNumbers.add(prevNumber);
    if (includeIndex) {
      adjacentNumbers.add(index);
    }
    adjacentNumbers.add(nextNumber);

    return adjacentNumbers;
  }
}
