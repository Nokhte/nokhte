import 'package:equatable/equatable.dart';

class Perspectives extends Equatable {
  final List newPerspectives;
  final String date;
  Perspectives({
    required this.newPerspectives,
    required this.date,
  });

  @override
  List<Object> get props => [newPerspectives, date];

  toJson() {
    return {
      "commits": [
        toObject(),
      ]
    };
  }

  Object toObject() {
    return {
      "dateOfCommit": date,
      "perspectives": newPerspectives,
    };
  }
}
